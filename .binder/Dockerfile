FROM python:3.7-slim

# Install system packages required for Jupyter + kernels
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    git \
    bash \
    ca-certificates \
    libzmq5 \
    libffi-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set up working directory
WORKDIR /home/jovyan

# Install Python packages including Jupyter and ipykernel
COPY requirements.txt ./
RUN pip install --upgrade pip && \
    pip install -r requirements.txt && \
    pip install notebook ipykernel && \
    python -m ipykernel install --user

# Expose port
EXPOSE 8888

# Default command
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
