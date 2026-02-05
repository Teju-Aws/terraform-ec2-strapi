
resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 4096
}


resource "local_file" "pem" {
  content         = tls_private_key.this.private_key_pem
  filename        = "${var.key_name}.pem"
  file_permission = "0400"
}


resource "aws_key_pair" "this" {
  key_name   = var.key_name
  public_key = tls_private_key.this.public_key_openssh
}


resource "aws_security_group" "this" {
  name = "strapi-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["122.177.240.242/32"]  
  }

  ingress {
    from_port   = 1337
    to_port     = 1337
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


resource "aws_instance" "this" {
  ami                    = "ami-0532be01f26a3de55" 
  instance_type          = var.instance_type
  key_name               = aws_key_pair.this.key_name
  vpc_security_group_ids = [aws_security_group.this.id]

  tags = {
    Name = "Strapi-EC2"
  }
}
