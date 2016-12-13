#!/bin/bash

## Execute the CI task from the Rakefile
#sudo $(which chef) exec rake ci

## Obtain the source AMI to use for our Packer build.
base_ami_id=$(aws ec2 describe-images --filters Name=tag-key,Values=name Name=tag-value,Values=linux-ubuntu-base --output text --query 'Images[*].[ImageId,CreationDate]' | sort -n -k 2 -r | cut -f1 | head -n1)

## Build an AMI for this cookbook
$(which chef) exec rake packer[$base_ami_id]

# Encrypt it
aws ec2 copy-image --source-region $(aws configure get region) -s $(cat ami-id) -n "GoCD-Server-Encrypted" --encrypted