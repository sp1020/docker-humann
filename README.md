# docker-humann

Docker image for HUMAnN

## Introduction 

- HUMAnN is a great tool for functional analysis of whole metagenome sequencing data. 
- This docker image may facilitate the usage of the software.
- Visit the following link for information on the program.
  - https://huttenhower.sph.harvard.edu/humann  
  - https://github.com/biobakery/humann
  
- HUMAnN versions: 3.7 (tag: 3.7; latest)

## Links

- GitHub Link: https://github.com/sp1020/docker-humann
- DockerHub Link: https://hub.docker.com/repository/docker/sphong/humann

## Quick Start 

### HUMAnN Database Setup

**(*) Download database only on the first occasion. (The procedure may take about an hour.)**

- Download database on local machine. 
  - Place the databases out of the image.
  - Mount the databases when creating containers. 

Step 1. Replace the database directory name 

- Open the  `download_databases.sh` script
- Specify `dir_db` as the directory where the database will be downloaded.

```bash
dir_db="/data/database/HUMAnN/201901b"
```

Step 2. Download database 

- Execute the `download_database.sh` script.

```bash
./download_databases.sh 
```

Step 3. Download `MetaPhlAn` database 

- Edit the `download_mpa_db.sh` file: `dir_db`
  - Specify `dir_db` as the directory where the MetaPhlAn database will be downloaded.
    - ⚠ Example: `/data/database/MetaPhlAn/vOct22`
  - (Optional) Specify `db_index` for the database 
    - ⚠ For HUMAnN 3.7 use `vOct22` version (`mpa_vOct22_CHOCOPhlAnSGB_202212`); more recent version conflict with other HUMAnN databases.
    - Do not modify the database unless there is a specific reason to do so.
- Execute the download script

```bash
./download_mpa_db.sh
```

* Consult the MetaPhlAn Docker image documentation below for details on the MetaPhlAn Docker image. 
  * https://github.com/sp1020/docker-metaphlan

### Execute HUMAnN commands

- Execute `HUMAnN`. 
  - ⚠ Mount `HUMAnN` database to `/database` directory 
  - ⚠ Mount `MetaPhlAn` database to `/database_mpa`
  - ⚠ Set `--metaphlan-options` with metaphlan_index
    - ```--metaphlan-options "--bowtie2db /database_mpa --index <MetaPhlAn-index>"```

**Example Codes**
```bash
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
```

**Refer to the scripts located in the `examples` directory**

## Prerequisite 

- docker 
- docker image: `sphong/metaphlan`
  - Required to download MetaPhlAn database.
  

## License 

- MIT License 

## Maintainers 

- Seungpyo Hong at Jeonbuk National University 

## Acknowledgements 

- HUMAnN
