FROM python:3.7-slim

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip install --upgrade pip

# Install Jupyter + IPython kernel
RUN pip install notebook ipykernel

# Install DeepTCR dependencies and DeepTCR
RUN pip install numpy==1.18 tensorflow==1.15 keras==2.2.4
RUN pip install git+https://github.com/sidhomj/DeepTCR.git

# Create a Jupyter kernel spec so it appears in the notebook UI
RUN python -m ipykernel install --name "deeptcr-env" --display-name "Python (deeptcr-env)"

# Set working directory
WORKDIR /home/jovyan

# Binder expects this to run automatically
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
