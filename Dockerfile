# Dockerfile for docker-flask web application

# Add a base image to build this image off of
FROM ubuntu:latest

#Install Python and pip
RUN apt-get update -y && apt-get install -y \
    python-pip \
    python-dev \
    build-essential
	
#Install Python modules needed by the Python app
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

#copy files required for app to run
COPY *.py /usr/src/app/
COPY app /usr/src/app/app
COPY db_repository /usr/src/app/db_repository

# Add a default port containers from this image should expose
EXPOSE 5000

# Add a default command for this image
CMD ["python", "/usr/src/app/run.py"]