#!/bin/bash

mkdir -p data
cd data

BASE="ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR286"

declare -A samples=(
  [ERR2868172]="002"
  [ERR2868173]="003"
  [ERR2868174]="004"
)

for SAMPLE in "${!samples[@]}"; do
  SUBDIR=${samples[$SAMPLE]}
  echo "Downloading $SAMPLE..."
  for END in 1 2; do
    wget -nc "${BASE}/${SUBDIR}/${SAMPLE}/${SAMPLE}_${END}.fastq.gz"
  done
done