variable "ami" {
    type = string
    default = "ami-0aa7d40eeae50c9a9"
}
variable "instance_type" {
    type = string
    default = "t2.micro"
}
variable "server_port" {
  description = "The port the server will use for HTTP requests"
  default = 80
}