FROM python:3.7-slim

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Speed up installs and avoid cache bloat
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    wget \
    curl \
    ca-certificates \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set workdir
WORKDIR /home/deeptcr-binder

# Copy code before installing requirements for Docker layer caching
COPY requirements.txt ./

# Pin NumPy and Cython to avoid build errors and improve startup
RUN pip install --upgrade pip \
 && pip install numpy==1.21.6 cython==0.29.36 \
 && pip install -r requirements.txt

# Copy rest of your repo
COPY . .

# Set default command for Binder
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser"]
