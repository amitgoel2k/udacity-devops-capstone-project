# Udacity-cloud-devops-engineer-capstone-project
This is the capstone project for fulfillment of [Udacity Cloud DevOps Engineer Nanodegree](https://www.udacity.com/course/cloud-dev-ops-nanodegree--nd9991).

This project is using - 
* [CircleCI](https://circleci.com/) for automated CICD pipeline
* [CloudFormation](https://aws.amazon.com/cloudformation/) for automatic deployment of infrastructure in [AWS](https://aws.amazon.com/)
* [Docker](https://www.docker.com/) for building containerized  apps
* [NGINX](https://www.nginx.com/) for serving the website
* [Ansible](https://www.ansible.com/) for automatic configuration of infrastructure
* [Minikube](https://minikube.sigs.k8s.io/docs/) for building Kubernetes clusters
* [CloudFront](https://aws.amazon.com/cloudfront/) to access the website content

## Project Overview
In this project a simple webapp is being built through a CircleCI CICD pipeline and deployed on a kybernetes cluster in AWS using a Blue/Green Deployment strategy.
The Kubernetes cluster has been built on AWS EC2 instances.

## The application: 

## Infrastructure:
Infrastructure creation and deployment is automated via AWS CloudFormation - run in a CircleCI pipeline that can be triggered whenever new code is merged in Github repo.

## Project Structure

## Project Files
```
├── ansible                 # Ansible
│   ├── ansible.cfg             # global ansible configuration
│   ├── inventory.txt           # inventory for hosts to run on
│   ├── roles                   # Roles for ansible playbooks
│   │   ├── install-tools       # role to install needed tools
│   │   └── k8s-cluster         # role to enable/start minikube cluster
│   └── setup-server.yaml       # main ansible playbook
├── architecture            # Architecture Diagrams
│   ├── cloud.svg
│   ├── cluster.svg
│   └── workflow.svg
├── .circleci               # CircleCI
│   └── config.yml              # config file for CI/CD pipeline
├── cloudformation          # AWS CloudFormation
│   ├── cloudfront.yaml         # create cloudfront stack
│   ├── network-params.json     # params for network stack
│   ├── network.yaml            # create network stack
│   ├── servers-params.json     # params for servers stack
│   └── servers.yaml            # create servers stack
├── deploy.sh               # Deployment shell script
├── Dockerfile              # Dockerfile for build the image
├── k8s                     # Kubernetes
│   ├── deploy-cluster.yaml     # create deployment and needed services
│   └── ingress.yaml            # create nginx ingress
├── Makefile                # Makefile having targets to automate tasks
├── nginx                   # nginx server configuration
├── package.json
├── package-lock.json
├── README.md
├── run.sh                  # Script for create/update/delete CloudFormation stacks
└── src                     # Source code of website
```
## How-to run
Configure CircleCI pipeline and connect through github
Install dependencies
Build the application (TypeScript --> JavaScript)
Lint the code
Build a Docker image based off of my Dockerfile
Upload the container to the Docker Registry
Create the Kubernetes configuration file
Deploy the application to my AWS EKS cluster
