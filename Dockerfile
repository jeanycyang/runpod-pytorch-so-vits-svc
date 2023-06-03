FROM runpod/pytorch:3.10-2.0.0-117

RUN apt-get update && apt-get -y install vim zip unzip rsync && \
    mkdir /content && git clone https://github.com/svc-develop-team/so-vits-svc /content/so-vits-svc -b 4.1-Stable && cd /content/so-vits-svc && \
  pip uninstall -y torchdata torchtext && \
  pip install --upgrade pip setuptools numpy numba && \
  pip install pyworld praat-parselmouth fairseq tensorboardX torchcrepe librosa==0.9.1 pyyaml pynvml pyloudnorm && \
  pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu118 && \
  pip install gdown tensorboard faiss-gpu matplotlib

WORKDIR /content/so-vits-svc

COPY *.sh /content/so-vits-svc/
