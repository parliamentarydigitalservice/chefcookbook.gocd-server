#!/bin/bash

export AWS_REGION=eu-west-1

## Execute the CI task from the Rakefile
#sudo $(which chef) exec rake ci

## Obtain the source AMI to use for our Packer build.
base_ami_id=$(aws ec2 describe-images \
    --filters Name=tag-key,Values=Name Name=tag-value,Values=base-ubuntu-16.04 \
    --output text --query 'Images[*].[ImageId,CreationDate]' \
    --region $AWS_REGION \
    | sort -k 2 -r | cut -f1 | head -n1 \
)

## Build an AMI for this cookbook
$(which chef) exec rake packer[$base_ami_id]

# Encrypt it
# aws ec2 copy-image --source-region $(aws configure get region) -s $(cat ami-id) -n "GoCD-Server-Encrypted" --encrypted

declare -a GRANTS=(378030785168 638960451485 165162103257 337667769842 430811725848 210277190260)
AMI_ID=$(cat ami-id)

for g in ${GRANTS[@]}; do
    echo Granting launch permission for $AMI_ID to $g
    aws ec2 modify-image-attribute --image-id $AMI_ID --launch-permission "{\"Add\": [{\"UserId\":\"$g\"}]}"
done