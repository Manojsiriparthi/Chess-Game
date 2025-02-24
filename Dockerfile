# Stage 1: Build Stage
FROM python:3.9 AS builder

# Set the working directory
WORKDIR /app

# Install boto3 and other dependencies
RUN pip install --upgrade pip && \
    pip install boto3 --target /app/dependencies

# Copy Python script and lambda.zip into the container
COPY python_script.py .
COPY lambda.zip .

# Stage 2: Final Lightweight Image
FROM python:3.9-slim AS final

# Set the working directory
WORKDIR /app

# Copy only necessary files from the builder stage
COPY --from=builder /app/dependencies /app/
COPY --from=builder /app/python_script.py .
COPY --from=builder /app/lambda.zip .

# Set the default command to run the Python script
CMD ["python", "python_script.py"]
