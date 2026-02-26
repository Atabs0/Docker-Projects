# terraform.tfvars
aws_region    = "us-east-1"
ami_id        = "ami-0f3caa1cf4417e51b"
instance_type = "t2.micro"
key_name      = "terraform-keypair1"
# subnet_id          = "subnet-0123456789abcdef0" #-------change this
# security_group_ids = ["sg-0123456789abcdef0"]
vpc_cidr           = "10.0.0.0/16"
public_subnet_cidr = "10.0.1.0/24"
availability_zone  = "us-east-1a"
