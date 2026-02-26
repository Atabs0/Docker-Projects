# variables.tf

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instances"
  type        = string
}
variable "instance_type" {
  description = "The instance type for the EC2 instances"
  type        = string
}
variable "key_name" {
  description = "The key pair name for SSH access"
  type        = string
}
# variable "subnet_id" {
#   description = "The subnet ID where the instances will be launched"
#   type        = string
# }
# variable "security_group_ids" {
#   description = "List of security group IDs to associate with the instances"
#   type        = list(string)
# }

variable "vpc_cidr" {
  type = string
}
variable "public_subnet_cidr" {
  type = string
}
variable "availability_zone" {
  type = string
}
