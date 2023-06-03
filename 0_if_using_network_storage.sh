#!/bin/sh
# volume should be mounted at /network_storage
cd /content/so-vits-svc
mkdir -p /network_storage/logs/44k/ /network_storage/logs/44k/diffusion /network_storage/dataset /network_storage/configs /network_storage/filelists
rm -rf logs
rm -rf dataset
rm -rf configs
rm -rf filelists
ln -s /network_storage/logs logs
ln -s /network_storage/dataset dataset
ln -s /network_storage/configs configs
ln -s /network_storage/filelists filelists
