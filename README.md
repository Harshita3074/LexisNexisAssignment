# LexisNexisAssignment

This repository consists of terraform code to provision a EC2 server (along with key-pair, security group). 
User-data is configured to install httpd and a sample index.html is created.

## Prerequsites

1. create a key-pair (example: using ssh-keygen) and update the public-key contents in terraform file, to create key-pair on AWS (which will be associated with EC2 server).
2. Create an S3 bucket to store terraform state file remotely. Update backend.tf file with the bucket details.
3. Install Git and configure "Global tool configurations > git" in Jenkins
4. Install Terraform on either Jenkins Master or Slave
5. Create access & secret key for an IAM user, configure the same local to server(for security reasons)

## Pipeline

1. The jenkins pipeline is created to provision the server on aws cloud, using terraform.
2. The pipeline needs appoval for provisioning & destroying the infrastructure.  

## Accessing Endpoint

Once the server is provisioned, please access the application using the endpoint "http://<server-public-IP>" on any browser.