#!/bin/bash

#substitute your AWS keys here
#execute this in the same folder as the script

export AWS_ACCESS_KEY_ID=<YOURKEY>
export AWS_SECRET_ACCESS_KEY=<YOURKEY>

cd ./packer
packer init jenkins.pkr.hcl
packer build jenkins.pkr.hcl
if [ $? -eq 0 ]; then
    cd ../terraform
    terraform init
    terraform apply
else
   echo "Packer failed to build the AMI"
fi

