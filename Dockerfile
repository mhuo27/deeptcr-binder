FROM python:3.7

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    wget \
    curl \
    python3.7-dev

RUN pip install --upgrade pip
RUN pip install numpy==1.19.5 keras==2.2.4 tensorflow==1.15
RUN pip install llvmlite==0.36.0

# Clone DeepTCR
RUN git clone https://github.com/sidhomj/DeepTCR.git /DeepTCR
WORKDIR /DeepTCR
RUN python setup.py install

EXPOSE 8888

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
