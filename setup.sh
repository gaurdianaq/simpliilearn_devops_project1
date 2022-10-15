#!/bin/bash

#substitute your AWS keys here
#execute this in the same folder as the script

export AWS_ACCESS_KEY_ID=AKIAYCHWKF7STU67TQGJ
export AWS_SECRET_ACCESS_KEY=2gKdr2bPGI3nh68WF5Ina6GNMoJ61BpnTHd3inUW

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

