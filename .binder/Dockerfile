# Use official Python 3.7 slim image
FROM python:3.7-slim

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    wget \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip install --upgrade pip

# Install specific package versions compatible with DeepTCR
RUN pip install numpy==1.18.0 tensorflow==1.15 keras==2.2.4

# Install DeepTCR directly from GitHub
RUN pip install git+https://github.com/sidhomj/DeepTCR.git

# Set working directory
WORKDIR /home/jovyan

# Expose Jupyter port
EXPOSE 8888

# Run Jupyter notebook with no browser, accessible on all interfaces
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
