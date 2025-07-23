# Use the official Jupyter minimal-notebook base image with Python 3.7
FROM jupyter/minimal-notebook:python-3.7.16

# Switch to root to install extra system packages if needed
USER root

# Install system dependencies needed for building some Python packages
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    g++ \
    libffi-dev \
    libssl-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Switch back to jovyan user
USER $NB_UID

# Copy your environment.yml file to the notebook directory
COPY environment.yml /home/jovyan/

# Create conda environment from environment.yml
RUN conda env create -f /home/jovyan/environment.yml && \
    conda clean -a -y

# Make sure the notebook uses the new environment
RUN echo "conda activate myenv" >> /home/jovyan/.bashrc

# Set environment variables
ENV PATH /opt/conda/envs/myenv/bin:$PATH

# Set working directory
WORKDIR /home/jovyan

# Expose port and start notebook
CMD ["start-notebook.sh"]
