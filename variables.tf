variable "ami" {
  type    = string
  default = "ami-0aa7d40eeae50c9a9"
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
variable "server_port" {
  description = "The port the server will use for HTTP requests"
  default     = 80
}

variable "sg_name" {
  default = "LexisNexisSG"
  type    = string
}

variable "ec2_name" {
  default = "LexisNexisAssignment"
  type    = string
}

variable "key_name" {
  default = "assignmentkey"
}