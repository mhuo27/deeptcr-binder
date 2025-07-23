FROM python:3.7-slim

# System dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    wget \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip install --upgrade pip

# Install Jupyter
RUN pip install notebook ipykernel

# Install DeepTCR dependencies
RUN pip install numpy==1.18.0 tensorflow==1.15 keras==2.2.4

# Install DeepTCR
RUN pip install git+https://github.com/sidhomj/DeepTCR.git

# Set workdir (optional)
WORKDIR /home/jovyan

# Expose Jupyter
EXPOSE 8888

# Start Jupyter
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
