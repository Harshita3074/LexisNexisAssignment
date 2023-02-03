resource "aws_instance" "LNA" {
  tags = {
    Name = var.ec2_name
  }
  security_groups = [var.sg_name]
  ami             = var.ami
  instance_type   = var.instance_type
  depends_on = [
    aws_security_group.sg
  ]
  user_data       = <<EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "Hello, World" > /var/www/html/index.html
    EOF
}

resource "aws_security_group" "sg" {
  name = var.sg_name
  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allows HTTP Traffic"
  }
}
