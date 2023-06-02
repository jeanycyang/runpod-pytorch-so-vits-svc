#!/bin/sh

export ZIP_FILE=so-vits-svc_$(date +"%Y%m%d%H%M%S").zip
zip -r $ZIP_FILE logs/ configs/ filelists/ -x "*.pt" "*.pth"
zip -u $ZIP_FILE $(ls logs/44k/G_*.pth | sort -V | tail -n 1)
zip -u $ZIP_FILE $(ls logs/44k/D_*.pth | sort -V | tail -n 1)
