# 1. Use the official Python 3.12-slim image as the base image
FROM python:3.12-slim

# 2. Set the working directory inside the container to /app
WORKDIR /app

# 3. Copy the requirements.txt file from the host machine to the container's working directory
COPY requirements.txt .

# 4. Install Python dependencies listed in requirements.txt
RUN pip install -r requirements.txt

# 5. Copy the app.py file from the host machine to the container's working directory
COPY app.py .

# 6. Set an environment variable inside the container for the metrics csv file This variable specifies the name of the csv file to be used by the application which must be docker_system_inference_metrics.csv
ENV CSV_FILE=docker_system_inference_metrics.csv

# 7. Expose port 5000 to allow external access to the application running inside the container
EXPOSE 5000

# 8. Specify the command to run the application when the container starts
CMD ["python", "app.py"]