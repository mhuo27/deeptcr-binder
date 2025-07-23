FROM continuumio/miniconda3

COPY environment.yml /tmp/environment.yml

RUN conda env create -f /tmp/environment.yml && conda clean -afy

SHELL ["conda", "run", "-n", "deeptcr-env", "/bin/bash", "-c"]

WORKDIR /DeepTCR

EXPOSE 8888

CMD ["conda", "run", "--no-capture-output", "-n", "deeptcr-env", "jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
