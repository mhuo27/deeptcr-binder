FROM python:3.7

RUN apt-get update && apt-get install -y \
    build-essential \
    python3.7-dev \
    git \
    wget \
    curl

RUN pip install numpy==1.19.5 keras==2.2.4 tensorflow==1.15

RUN git clone https://github.com/sidhomj/DeepTCR.git /DeepTCR
WORKDIR /DeepTCR
RUN python setup.py install

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser"]
