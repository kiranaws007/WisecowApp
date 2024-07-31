Created an EC2 instance in AWS with Ubuntu OS and Installed git, docker and updated. 
Created Docker file for building the Wisecow application as a multi-stage build, so you can use an intermediate stage to install dependencies and build your application. This can help reduce the final image size by excluding unnecessary build tools and intermediate files.

vi Dockerfile
Used the ubuntu:latest base image again to create a clean, smaller image with only the runtime dependencies.

docker build -t kirankumars/wisecowapp:latest .	  # building image using docker file for wisecow.sh file

docker run -d -p 4499:4499 kirankumars/wisecowapp:latest   # port 4499  and docker runs in background\

docker push kirankumars/wisecowapp:latest  # Push using docker image to Dockerhub Repository

We see the build image using: docker ps 

docker inspect e04c5c6e97d4

docker inspect e04c5c6e97d4 | grep -i ipaddress # to get ipaddress for output 

curl -k 172.17.0.2:4499 # to see the output curl -k ip:portno

after completion
To delete all containers including its volumes use,
docker rm -vf $(docker ps -aq)

To delete all the images,
docker rmi -f $(docker images -aq)

 Kubernetes manifest files to deploy the Wisecow application 

Used an Ingress controller: To handle HTTPS termination and route traffic.
Updated Kubernetes manifests: For deployment, service, and ingress.
This setup will ensure that the Wisecow application is served over HTTPS with TLS certificates

Used openssl for tls.crt, tls.key, tls.csr 

Used Google Cloud for Kubernetes GKE
using files and command applied
kubectl apply -f deployment.yaml
kubectl apply -f service.yml
kubectl apply -f ingress.yml

To Verify use commands
kubectl get deployments
kubectl get services
kubectl get ingresses

To check logs
kubectl logs wisecow-deployment-867b5dc46d-mlbg7

To check all the information of pods you can see status and ip and, volume, and etc...
kubectl describe pod wisecow-deployment-867b5dc46d-b6d6j

delete all resources default
kubectl delete all --all -n default

Created Github actions Implements CICD pipeline using the DockerHub and Google Cloud Gke and provided all the login credetials as Secrets
In the practical statement2
for backup I have used the aws s3 bucket
IP Address is used for Health monitoing and app health checker then log analyzer for logs all the scripts 













