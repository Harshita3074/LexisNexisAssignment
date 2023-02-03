# LexisNexisAssignment

This repository consists of terraform code to provision a EC2 server (along with key-pair, security group). User-data is configured to install httpd and a sample index.html is created.

#Prerequsites#
create a key-pair (example: using ssh-keygen) and update the public-key contents in terraform file, to create key-pair on AWS (which will be associated with EC2 server).
