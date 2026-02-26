# Generate a new SSH key pair locally
resource "tls_private_key" "generated_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
# Create AWS Key Pair from the generated public key
resource "aws_key_pair" "generated_keypair" {
  key_name   = "terraform-keypair1"
  public_key = tls_private_key.generated_key.public_key_openssh
}
# Save the private key to a local .pem file
resource "local_file" "private_key_file" {
  content              = tls_private_key.generated_key.private_key_pem
  filename             = "${path.module}/terraform-keypair1.pem"
  file_permission      = "0400"
  directory_permission = "0700"
}
