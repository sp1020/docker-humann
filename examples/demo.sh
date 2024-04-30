#!/bin/bash
db_humann="/data/database/HUMAnN/201901b"
db_metaphlan="/data/database/MetaPhlAn/vOct22/"
metaphlan_index="mpa_vOct22_CHOCOPhlAnSGB_202212"

## Download a demo data file
mkdir inputs
mkdir results
wget -O inputs/demo.fastq.gz https://github.com/biobakery/humann/raw/master/examples/demo.fastq.gz

## Execute the code 
docker run --rm -v $PWD:/data \
    -v $db_humann:/database \
    -v $db_metaphlan:/database_mpa \
    -e USER_ID=$(id -u) \
    -e GROUP_ID=$(id -g) \
    sphong/humann \
    humann \
    --input inputs/demo.fastq.gz \
    --output results/demo_fastq \
    --metaphlan-options "--bowtie2db /database_mpa --index $metaphlan_index" \
    --threads 20

## Reference 
# - https://github.com/biobakery/biobakery/wiki/humann3
