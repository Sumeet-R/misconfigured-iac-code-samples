resource "aws_instance" "instance1" {
  ami           = "ami-035c5dc086849b5de"
  instance_type = "t2.micro"
  root_block_device {
    volume_size = 100
  }
  subnet_id = aws_subnet.test_subnet1.id
 vpc_security_group_ids = [aws_security_group.test_sg1.id]
  key_name = "ssh_key"
  associate_public_ip_address = "true"
  metadata_options {
    http_tokens = "optional"
  }
  tags = {
    Name = "ec2-01_Terraform"
  }
}

resource "aws_instance" "instance2" {
  ami           = "ami-02dd6914ad5bda81d"
  instance_type = "t2.micro"
  root_block_device {
    volume_size = 100
  }
  subnet_id = aws_subnet.test_subnet1.id
 vpc_security_group_ids = [aws_security_group.test_sg2.id]
  key_name = "ssh_key"
  associate_public_ip_address = "true"
  metadata_options {
    http_tokens = "optional"
  }
  tags = {
    Name = "ec2-02_Terraform"
  }
}

