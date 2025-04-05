resource "aws_instance" "server-1" {
  ami           = "ami-02f624c08a83ca16f" # Replace with your desired AMI ID
  instance_type = "t2.micro"
  key_name      = aws_key_pair.my_aws_key.key_name
  subnet_id     = aws_subnet.public_subnet1.id
  vpc_security_group_ids = [aws_security_group.example_sg.id]
  user_data     = filebase64("file.sh")

  tags = {
    Name = "Dev-Ops-Instance"
  }

  depends_on = [aws_security_group.example_sg]
}
