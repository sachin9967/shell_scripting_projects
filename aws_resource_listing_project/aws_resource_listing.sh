#!/bin/bash
#
############################################
#author:sachin
#date:14 july
#
#version v1
#
#desc:this script will report the aws resource usage
#
###########################################

echo "listing s3 instances"
aws s3 ls > resourceTracker


echo "listing ec2 instances"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'

echo "lambda functions"
aws lambda list-functions >> resourceTracker

echo  "IAM users"
aws iam list-users
