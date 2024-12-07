# Dockerfile
FROM python:3.12

WORKDIR /app

# Install system dependencies and psycopg2 dependencies
RUN apt-get update && apt-get install -y \
	libpq-dev gcc && \
	rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY dev-requirements.txt .
RUN pip install --no-cache-dir -r dev-requirements.txt

# Copy application code
COPY . .

# Expose port 8000
EXPOSE 8000
