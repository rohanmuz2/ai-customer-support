# Use an appropriate base image, e.g., python:3.10-slim
FROM python:3.10-slim

RUN pip install --upgrade pip

# other required libraries if you know them
# Set environment variables (e.g., set Python to run in unbuffered mode)
# ENV PYTHONUNBUFFERED 1

# Set the working directory
WORKDIR /app

# Copy your application's requirements and install them
COPY requirements.txt /app/
RUN pip install -v -r /app/requirements.txt

# Copy your application code into the container
COPY . /app/

EXPOSE 8080

# CMD ["python", "-m", "app"]

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
