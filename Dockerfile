FROM continuumio/miniconda3

# Create conda environment and install dependencies
COPY environment.yml /tmp/environment.yml

RUN conda env create -f /tmp/environment.yml

# Activate conda environment
SHELL ["conda", "run", "-n", "deeptcr-env", "/bin/bash", "-c"]

WORKDIR /DeepTCR

# Clone DeepTCR repo
RUN git clone https://github.com/sidhomj/DeepTCR.git /DeepTCR

# Install DeepTCR (use conda environment's python)
RUN conda run -n deeptcr-env python setup.py install

EXPOSE 8888

CMD ["conda", "run", "--no-capture-output", "-n", "deeptcr-env", "jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
