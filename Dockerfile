FROM continuumio/miniconda3

# Copy environment.yml into the image
COPY environment.yml /tmp/environment.yml

# Create the conda environment from environment.yml and clean up
RUN conda env create -f /tmp/environment.yml && conda clean -afy

# Activate environment and set shell for next commands
SHELL ["conda", "run", "-n", "deeptcr-env", "/bin/bash", "-c"]

# Set working directory (optional, if you have local code to add)
WORKDIR /DeepTCR

# Expose Jupyter port
EXPOSE 8888

# Run Jupyter Notebook inside the conda environment
CMD ["conda", "run", "--no-capture-output", "-n", "deeptcr-env", "jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
