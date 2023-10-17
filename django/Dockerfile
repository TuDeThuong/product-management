# Use the official Python image as a parent image
FROM python:3.8

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1


# Install dependencies
COPY requirements.txt /app/
RUN pip install -r requirements.txt
RUN chmod 777 .
# Copy the Django project into the container
COPY . /app/

# Start the Django application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
