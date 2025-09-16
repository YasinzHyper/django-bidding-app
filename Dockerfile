# Use Python 3.9 (updated from 3.7 for better security and features)
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set work directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install Python dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Create a non-root user
RUN adduser --disabled-password --gecos '' appuser

# Copy project
COPY . /app/

# Create directories and set permissions
RUN mkdir -p /app/data /app/staticfiles && \
    chown -R appuser:appuser /app

# Switch to non-root user
USER appuser

# Copy entrypoint script and make it executable
COPY entrypoint.sh /app/entrypoint.sh
USER root
RUN chmod +x /app/entrypoint.sh
USER appuser

# Expose port
EXPOSE 8000

# Set entrypoint
ENTRYPOINT ["/app/entrypoint.sh"]

# Default command
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "bidding_system.wsgi:application"]