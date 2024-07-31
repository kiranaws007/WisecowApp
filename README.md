Created an EC2 instance in AWS with Ubuntu OS and Installed git, docker and updated. 
Created Docker file for building the Wisecow application as a multi-stage build, so you can use an intermediate stage to install dependencies and build your application. This can help reduce the final image size by excluding unnecessary build tools and intermediate files.
vi Dockerfile
Used the ubuntu:latest base image again to create a clean, smaller image with only the runtime dependencies.
docker build -t kirankumars/wisecowapp:latest .	  # building image using docker file for wisecow.sh file
docker run -d -p 4499:4499 kirankumars/wisecowapp:latest   # port 4499  and docker runs in background
docker push kirankumars/wisecowapp:latest  # Push using docker image to Dockerhub Repository
We see the build image using: docker ps 
docker inspect e04c5c6e97d4
docker inspect e04c5c6e97d4 | grep -i ipaddress # to get ipaddress for output 
curl -k 172.17.0.2:4499 # to see the output curl -k ip:portno


