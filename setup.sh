#!/bin/bash

#substitute your AWS keys here
#execute this in the same folder as the script

export AWS_ACCESS_KEY_ID=<YOURKEY>
export AWS_SECRET_ACCESS_KEY=<YOURKEY>

public_ssh_key=<YOURKEY>

if [ $1 == "full" ]; then #run packer and terraform (this will rebuild the ami and redeploy it, even if there are no changes)
    cd ./packer
    packer build jenkins.pkr.hcl
    if [ $? -eq 0 ]; then
        cd ../terraform
        terraform apply -var "ssh_key=$public_ssh_key"
    else
        echo "Packer failed to build the AMI"
    fi
elif [ $1 == "terraform" ]; then #just run any terraform changes without running packer
    cd terraform
    terraform apply -var "ssh_key=$public_ssh_key"
elif [ $1 == "initial" ]; then #runs the init command for terraform and packer, use on first run
    cd ./packer
    packer init jenkins.pkr.hcl
    packer build jenkins.pkr.hcl
    if [ $? -eq 0 ]; then
        cd ../terraform
        terraform init
        terraform apply -var "ssh_key=$public_ssh_key"
    else
        echo "Packer failed to build the AMI"
    fi
else
    echo $1 " is not a valid command, use 'full', 'terraform', or 'initial'"
fi

