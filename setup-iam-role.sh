#!/usr/bin/env bash

EKS_ROLE_NAME=$1
EKS_PROFILE_NAME=udacity-eks
CFN_STACK_NAME=eksctl-udacity-cluster
EKS_ADMIN_USER=udacity-eks-admin-user
AWS_REGION=us-east-1

aws cloudformation deploy \
  --template-file ../infra/iam.yaml \
  --stack-name $CFN_STACK_NAME \
  --parameter-overrides EKSUserName=$EKS_ADMIN_USER EKSRoleName=$EKS_ROLE_NAME \
  --region $AWS_REGION \
  --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" \
  --tags project=udacity-capstone
 

# ~/.aws/config [default]
aws configure set default.output json
aws configure set default.region $AWS_REGION

# ~/.aws/config [profile uda-eks-admin]
echo "retrieving eks role arn..."
EKS_ADMIN_ROLE_ARN=$(aws cloudformation describe-stacks --stack-name $CFN_STACK_NAME --region $AWS_REGION --query "Stacks[0].Outputs[?OutputKey=='EKSAdminRoleARN'].OutputValue" --output text)

echo $EKS_ADMIN_ROLE_ARN

aws configure set profile.$EKS_PROFILE_NAME.output json
aws configure set profile.$EKS_PROFILE_NAME.region $AWS_REGION
aws configure set profile.$EKS_PROFILE_NAME.role_arn $EKS_ADMIN_ROLE_ARN
aws configure set profile.$EKS_PROFILE_NAME.source_profile default

# set ~/.aws/credentials and ~/.aws/config
CREATE_ACCESS_KEY_OUTPUT=$(aws iam create-access-key --user-name $EKS_ADMIN_USER)
ACCESS_KEY_ENVIRONMENT=$(echo $CREATE_ACCESS_KEY_OUTPUT | jq -r '.AccessKey | .["AWS_ACCESS_KEY_ID"] = .AccessKeyId | .["AWS_SECRET_ACCESS_KEY"] = .SecretAccessKey | del(.AccessKeyId, .SecretAccessKey, .UserName, .Status, .CreateDate) | to_entries[] | "export \(.key)=\(.value)"')

#echo "CREATE_ACCESS_KEY_OUTPUT=$CREATE_ACCESS_KEY_OUTPUT"
#echo "ACCESS_KEY_ENVIRONMENT=$ACCESS_KEY_ENVIRONMENT"

eval $ACCESS_KEY_ENVIRONMENT

#echo "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID"
#echo "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY"

# ~/.aws/credentials [default]
aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY