FROM python:3.7
# Set the working directory to /app
WORKDIR /app
# Copy the current directory contents into the container at /app
ADD . /app
# Run python's package manager and install the flask package
RUN pip install -r requirements.txt
# Configure ports
EXPOSE 80
# Run apt-get, to install the SSH server, and supervisor
RUN apt-get update \
  && apt-get install -y supervisor \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean
# start scripts

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]