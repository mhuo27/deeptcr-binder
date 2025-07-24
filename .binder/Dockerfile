# Use python slim base
FROM python:3.7-slim

# Install only necessary system packages temporarily
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install all Python dependencies in one go, no cache to reduce image size
RUN pip install --no-cache-dir \
    notebook ipykernel numpy==1.18 tensorflow==1.15 keras==2.2.4 \
    git+https://github.com/sidhomj/DeepTCR.git

# Remove build tools after Python package install to reduce final image size
RUN apt-get purge -y --auto-remove build-essential git curl

# Register the Jupyter kernel
RUN python -m ipykernel install --name "deeptcr-env" --display-name "Python (deeptcr-env)" --user

# Set working directory
WORKDIR /home/jovyan
