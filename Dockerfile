# Use Python 3.9 as base image
FROM python:3.9

# Set working directory inside container
WORKDIR /app

# Install dependencies
RUN pip install boto3

# Copy script and any necessary files into the container
COPY python_script.py .
COPY lambda.zip .

# Set default command to execute the script
CMD ["python", "python_script.py"]

