# Udacity-cloud-devops-engineer-capstone-project
This is the capstone project for fulfillment of [Udacity Cloud DevOps Engineer Nanodegree](https://www.udacity.com/course/cloud-dev-ops-nanodegree--nd9991).

This project is using - 
* Circleci for automated CICD pipeline
* Docker for building containerized  apps
* EKSCTL for building Kubernetes Cluster in [AWS](https://aws.amazon.com/) which in turn uses Cloudformation


## Project Overview
In this project a docker image has been built for a simple python app which has been pushed to DockerHub and deployed on a kubernetes cluster in AWS(EKS). All the build/deployment actions have been automated through a CircleCI CICD pipeline.

## Pipeline Stages
* Setup virtual environment and install dependencies
* Lint the code
* Build and Push docker Image
* Setup IAM
* Create EKS Cluster if does't exist
* Pull docker image and deploy application to EKS Cluster
