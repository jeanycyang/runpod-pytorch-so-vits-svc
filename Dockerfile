FROM runpod/pytorch:cuda12

RUN apt-get update && apt-get -y install vim zip unzip
RUN mkdir /content && git clone https://github.com/svc-develop-team/so-vits-svc /content/so-vits-svc -b 4.1-Stable && cd /content/so-vits-svc

RUN pip uninstall -y torchdata torchtext && \
  pip install --upgrade pip setuptools numpy numba && \
  pip install pyworld praat-parselmouth fairseq tensorboardX torchcrepe librosa==0.9.1 pyyaml pynvml pyloudnorm && \
  pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu118

RUN pip install gdown tensorboard faiss-gpu matplotlib

WORKDIR /content/so-vits-svc

# Download pretrained models
# export D_0_URL="https://huggingface.co/datasets/ms903/sovits4.0-768vec-layer12/resolve/main/sovits_768l12_pre_large_320k/clean_D_320000.pth"
# export G_0_URL="https://huggingface.co/datasets/ms903/sovits4.0-768vec-layer12/resolve/main/sovits_768l12_pre_large_320k/clean_G_320000.pth"
# curl -L $D_0_URL -o logs/44k/D_0.pth
# curl -L $G_0_URL -o logs/44k/G_0.pth
# export diff_model_URL="https://huggingface.co/datasets/ms903/Diff-SVC-refactor-pre-trained-model/resolve/main/fix_pitch_add_vctk_600k/model_0.pt"
# curl -L $diff_model_URL -o logs/44k/diffusion/model_0.pt

# Download dataset from Google Drive
# gdown -O /content/dataset.zip https://drive.google.com/uc?id=XXXX

# python preprocess_flist_config.py --speech_encoder="vec768l12"
# unzip -od / /content/dataset.zip
# tensorboard --logdir logs/44k --host=0.0.0.0 &
# python train.py -c "configs/config.json" -m 44k

# export ZIP_FILE=so-vits-svc_$(date +"%Y%m%d%H%M%S").zip
# zip -r $ZIP_FILE logs/ configs/ filelists/ -x "*.pt" "*.pth"
# zip -u $ZIP_FILE $(ls logs/44k/G_*.pth | sort -V | tail -n 1)
# zip -u $ZIP_FILE $(ls logs/44k/D_*.pth | sort -V | tail -n 1)