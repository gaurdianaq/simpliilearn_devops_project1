# simpliilearn_devops_project1

## Prerequisites

- Python is installed
- Ansible is installed
- Terraform is installed
- Packer is installed

## Instructions

1. Edit setup.sh to add your AWS credentials and the contents of your public ssh key that you want to use for connecting to your ec2 instance.
2. Ensure setup.sh has execute permissions by running `sudo chmod +x ./setup.sh`
3. Run `./setup.sh initial` from the **root** folder of the project, not in any of the subfolders.

For subsequent runs, you can run `./setup.sh full` to run packer and terraform (without running init again) or `./setup.sh terraform` to only apply terraform changes without rerunning packer. Alternatively you can run packer and terraform directly as setup.sh is just meant to be a convenience script.
