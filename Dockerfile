FROM public.ecr.aws/docker/library/python:3.13-slim

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install curl for healthcheck
RUN apt-get update && apt-get install -y curl

# Install any needed packages specified in Poetry
RUN pip install --upgrade pip
RUN pip install poetry
RUN poetry config virtualenvs.create false
RUN poetry install --no-root

# Expose the port the app runs on
EXPOSE 8000

CMD ["python", "manage.py", "runserver"]