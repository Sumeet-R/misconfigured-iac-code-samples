resource "aws_security_group" "test_sg1" {
  name        = "allowSSH_terraform"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.test_vpc1.id
/*
  ingress {
    description      = "SSH inside VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
*/
  egress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Allow SSH inbound traffic"
  }
}


resource "aws_security_group" "test_sg2" {
  name        = "allowRDP_terraform"
  description = "Allow RDP inbound traffic"
  vpc_id      = aws_vpc.test_vpc1.id
/*
  ingress {
    description      = "RDP inside VPC"
    from_port        = 3389
    to_port          = 3389
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
*/
  egress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Allow SSH inbound traffic"
  }
}
