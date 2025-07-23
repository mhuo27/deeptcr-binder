# Start from a standard Jupyter minimal notebook image
FROM jupyter/minimal-notebook:latest

USER root

# Install the required system dependency for psutil build
RUN apt-get update && apt-get install -y libcrypt-dev && apt-get clean && rm -rf /var/lib/apt/lists/*

USER $NB_UID

# Copy your environment.yml into the image
COPY .binder/environment.yml /home/$NB_USER/.binder/environment.yml

# Install the conda environment using mamba
RUN mamba env update -p $CONDA_DIR/envs/$NB_PYTHON_PREFIX --file /home/$NB_USER/.binder/environment.yml && \
    mamba clean --all -f -y

# Switch back to notebook user
USER $NB_UID
