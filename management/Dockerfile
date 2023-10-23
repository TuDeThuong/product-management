# Use the official Python image as a parent image
FROM python:3.8

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

# Copy the Django project into the container
COPY . /app/

# Install dependencies
COPY requirements.txt /app/
RUN pip install django
RUN pip install djangorestframework 
RUN chmod 777 .


# Start the Django application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
