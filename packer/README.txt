Packer provisioner goss have to be installed.
https://github.com/YaleUniversity/packer-provisioner-goss


How to run:

packer build \
    -var "aws_vpc_id=vpc-0c94cd0ee1a6e0299" \
    -var "aws_subnet_id=subnet-0001f0942fe38be36" \
    -var "playbook_file=../ansible/bastion.yml" \
    -var "goss_path=../goss" \
    -var "goss_file=bastion.yaml"
    bastion.json

Specify your VPC and subnet IDs!!!