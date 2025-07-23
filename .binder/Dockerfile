FROM python:3.7-slim

# System dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip and install Python dependencies
RUN pip install --upgrade pip

# Install Jupyter, IPython kernel, and DeepTCR dependencies
RUN pip install notebook ipykernel numpy==1.18 tensorflow==1.15 keras==2.2.4

# Install DeepTCR from GitHub
RUN pip install git+https://github.com/sidhomj/DeepTCR.git

# Register the kernel so it shows up in the Jupyter UI
RUN python -m ipykernel install --name "deeptcr-env" --display-name "Python (deeptcr-env)" --user

# Set working directory
WORKDIR /home/jovyan

# Let Binder handle startup (don't override CMD or ENTRYPOINT)
