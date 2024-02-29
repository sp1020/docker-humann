docker build -f Dockerfile.3.7 -t sphong/humann:3.7 .
docker build -f Dockerfile.3.7 -t sphong/humann:latest .
docker push sphong/humann:3.7
docker push sphong/humann:latest