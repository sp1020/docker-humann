#!/bin/bash

# Set the local directory where the database will be downloaded
dir_db="/data/database/MetaPhlAn/vOct22"

# Set database index 
db_index="mpa_vOct22_CHOCOPhlAnSGB_202212"

# Create local database directory
mkdir -p $dir_db

# Download the database 
docker run -it --rm -v $dir_db:/database sphong/metaphlan metaphlan --install --index $db_index --bowtie2db /database
