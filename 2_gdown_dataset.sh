#!/bin/sh
if [ -n $DATASET_UC_ID ]; then
  gdown -O /content/dataset.zip https://drive.google.com/uc?id=$DATASET_UC_ID &
else
  echo "DATASET_UC_ID not given"
fi

if [ -n $RESUME_TRAINING_DATA_UC_ID ]; then
  gdown -O /content/resume.zip https://drive.google.com/uc?id=$RESUME_TRAINING_DATA_UC_ID &
else
  echo "RESUME_TRAINING_DATA_UC_ID not given"
fi
