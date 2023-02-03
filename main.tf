resource "aws_key_pair" "sample_kp" {
  key_name   = var.key_name
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDwh1ulL3Sx9EQi9cVyVGGk4QdrBE5nBc39QzuGAdiPiD7BtPLbt8aBnfsy7JmmZCQagXTB/LcKLvF5fSxoRLqKBucW1DDK9prknJPbrEWdoBYzaPPpQg07WbO8c9sFSHQEz1vx7ZHPW2eZ12vhyp7ODNuBknWBDCeyj/vocr90j5+aYIoenWUVFsORSnU1HZQYWK0FtxmctoVyWFWyILleLEdGOOB4c9g62Sz5iHQErcIXFTJPuAJmWabzlciJ3n74p4Pb6tpD2sii4lM1fyut8BG5pAE1vSyo+OklnPkn8gJ2MHFN3LYBtmy0oAhO/6FJhA0heghyr6mgko8MvRh36p+eTgj616IjGgMFNa6prvsh2ah0EddT+yfTyjssJs4vNNGPWefJ+FsUCaRkfsnVDjreEc44EtAGFSD5k1Ya9CTrApdaLForj7A88c46MPw+bPEANDZWR/LFBULMR/dVEdF9YTM7WZSWTEYFgYcLdr03acoMCTznrEdSwcBOdHs= nitish.chandu@NitishChandu"
}

resource "aws_instance" "LNA" {
  tags = {
    Name = var.ec2_name
  }
  security_groups = [var.sg_name]
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = aws_key_pair.sample_kp.key_name
  depends_on = [
    aws_security_group.sg
  ]
  user_data = <<EOF
#!/bin/bash
set -x
yum update -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd
echo "hi" > /var/www/html/index.html
EOF

}

resource "aws_security_group" "sg" {
  name = var.sg_name
  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allowing HTTP Traffic from internet"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allowing outbound Traffic to internet"
  }
}
