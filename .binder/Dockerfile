# .binder/Dockerfile
FROM python:3.7-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip

RUN pip install notebook ipykernel numpy==1.18 tensorflow==1.15 keras==2.2.4

RUN pip install git+https://github.com/sidhomj/DeepTCR.git

RUN python -m ipykernel install --name "deeptcr-env" --display-name "Python (deeptcr-env)" --user

WORKDIR /home/jovyan
