# Use the official Python image as a parent image
FROM python:3.8-alpine3.13

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

# Copy the Django project into the container
COPY . /app/

# Install dependencies
COPY ./management/requirements.txt /app/
RUN pip install django
RUN pip install djangorestframework
RUN pip install psycopg2
RUN pip install drf-spectacular
RUN chmod 777 .

RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    apk add --update --no-cache postgresql-client jpeg-dev && \
    apk add --update --no-cache --virtual .tmp-build-deps \
    build-base postgresql-dev musl-dev zlib zlib-dev linux-headers && \
    fi && \
    rm -rf /tmp && \
    apk del .tmp-build-deps && \
    adduser \
    --disabled-password \
    --no-create-home \
    django-user && \
    mkdir -p /vol/web/media && \
    mkdir -p /vol/web/static && \
    chown -R django-user:django-user /vol && \
    chmod -R 755 /vol && \
    chmod -R +x /scripts

ENV PATH="/scripts:/py/bin:$PATH"

USER django-user

# Start the Django application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
