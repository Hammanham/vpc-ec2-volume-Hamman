# Generate an SSH key pair locally
resource "tls_private_key" "my_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Upload the public key to AWS as a Key Pair
resource "aws_key_pair" "my_aws_key" {
  key_name   = "my-keypair" # AWS Key Pair Name
  public_key = tls_private_key.my_key.public_key_openssh

  tags = {
    Name = "my-keypair"
  }
}

# Save the private key locally
resource "local_file" "private_key" {
  filename        = "${path.module}/my-keypair.pem"
  content         = tls_private_key.my_key.private_key_pem
  file_permission = "0600" # Secure file permissions
}
