#!/bin/sh

# Download pretrained models
export D_0_URL="https://huggingface.co/datasets/ms903/sovits4.0-768vec-layer12/resolve/main/sovits_768l12_pre_large_320k/clean_D_320000.pth"
export G_0_URL="https://huggingface.co/datasets/ms903/sovits4.0-768vec-layer12/resolve/main/sovits_768l12_pre_large_320k/clean_G_320000.pth"
curl -L $D_0_URL -o logs/44k/D_0.pth
curl -L $G_0_URL -o logs/44k/G_0.pth

export diff_model_URL="https://huggingface.co/datasets/ms903/Diff-SVC-refactor-pre-trained-model/resolve/main/fix_pitch_add_vctk_600k/model_0.pt"
curl -L $diff_model_URL -o logs/44k/diffusion/model_0.pt