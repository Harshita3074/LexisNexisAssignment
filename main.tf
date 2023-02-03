resource "aws_instance" "LNA" {
    tags = {
        Name="LexisNexisAssignment"
    }
    ami           = var.ami
    instance_type = var.instance_type
    user_data = <<EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "Hello, World" > /var/www/html/index.html
    EOF
}
resource "aws_security_group" "SG" {
    name = "LexisNexisSG"
    ingress{
        from_port	  = "${var.server_port}"
        to_port	    = "${var.server_port}"
        protocol	  = "tcp"
        cidr_blocks	= ["0.0.0.0/0"]   
    }
    description = "Allows HTTP Traffic"
}