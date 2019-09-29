# packer-ansible-goss-terraform
Code to spin up bastion host in the AWS

## Tools used
- ansible 2.8.0
- terraform v0.12.0
- packer v1.4.3
- git 2.21.0

## How to use
0. Prepare your environment. Install tools. Configure git `git configure`.
1. Create bastion host AMI using packer (specify your VPC and subnet IDs.)
```
packer build \
    -var "aws_vpc_id=vpc-0c94cd0ee1a6e0299" \
    -var "aws_subnet_id=subnet-0001f0942fe38be36" \
    -var "playbook_file=../ansible/bastion.yml" \
    -var "goss_path=../goss" \
    -var "goss_file=bastion.yaml"
    bastion.json
```

2. Provision AWS infrastructure with terraform (specify AMI id created by packer)
```
terraform apply -var ami_id=ami-04cf43aca3e6f3de3
```
