FROM python:3.7-slim

# Essential dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    git \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip install --upgrade pip

# Install Jupyter and kernel support
RUN pip install notebook ipykernel

# Install DeepTCR dependencies (can be customized further)
RUN pip install numpy==1.18 tensorflow==1.15 keras==2.2.4

# Install DeepTCR
RUN pip install git+https://github.com/sidhomj/DeepTCR.git

# Register kernel
RUN python -m ipykernel install --name "deeptcr-env" --display-name "Python (deeptcr-env)"

# Set default working directory
WORKDIR /home/jovyan

# Launch Jupyter Notebook on container start
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--NotebookApp.token=''", "--no-browser", "--allow-root"]
