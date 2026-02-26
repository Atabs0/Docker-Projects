# # Generate a new SSH key pair locally
# resource "tls_private_key" "generated_key" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }
# # Create AWS Key Pair from the generated public key
# resource "aws_key_pair" "generated_keypair" {
#   key_name   = var.key_name
#   public_key = tls_private_key.generated_key.public_key_openssh
# }
# # Save the private key to a local .pem file
# resource "local_file" "private_key_file" {
#   content              = tls_private_key.generated_key.private_key_pem
#   filename             = "${path.module}/terraform-keypair2.pem"
#   file_permission      = "0400"
#   directory_permission = "0700"
# }

# Security Group
resource "aws_security_group" "nginx_sg" {
  name        = "nginx-sg"
  description = "Allow SSH, HTTP, and HTTPS"
  vpc_id      = aws_vpc.main_vpc.id # Use the VPC ID from the VPC resource
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}