FROM mcr.microsoft.com/devcontainers/python:3.13

# Install additional system packages if needed
RUN apt-get update && apt-get install -y \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install uv for faster Python package management
RUN pip install uv

# Set working directory
WORKDIR /workspace

# Copy requirements first for better Docker layer caching
COPY pyproject.toml uv.lock* ./

# Install Python dependencies
RUN uv sync --frozen

# Set environment variables
ENV PYTHONPATH=/workspace
ENV JUPYTER_ENABLE_LAB=yes