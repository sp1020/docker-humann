#!/bin/bash 

# set the database (absolute path); rename the directory for local
dir_db="/data/database/HUMAnN/201901b"

# chocophlan / full
mkdir -p $dir_db/chocophlan
cd $dir_db/chocophlan
wget http://huttenhower.sph.harvard.edu/humann_data/chocophlan/full_chocophlan.v201901_v31.tar.gz --no-check-certificate
tar zxvf full_chocophlan.v201901_v31.tar.gz
rm full_chocophlan.v201901_v31.tar.gz

# uniref / uniref90_diamond
mkdir -p $dir_db/uniref
cd $dir_db/uniref
wget http://huttenhower.sph.harvard.edu/humann_data/uniprot/uniref_annotated/uniref90_annotated_v201901b_full.tar.gz --no-check-certificate
tar zxvf uniref90_annotated_v201901b_full.tar.gz
rm uniref90_annotated_v201901b_full.tar.gz

# utility_mapping
mkdir -p $dir_db/utility_mapping
cd $dir_db/utility_mapping
wget http://huttenhower.sph.harvard.edu/humann_data/full_mapping_v201901b.tar.gz --no-check-certificate
tar zxvf full_mapping_v201901b.tar.gz
rm full_mapping_v201901b.tar.gz
