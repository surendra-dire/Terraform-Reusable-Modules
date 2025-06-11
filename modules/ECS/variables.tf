variable "aws_region" {
  default = "eu-west-1"
}

variable "app_name" {
  default = "my-app"
}

variable "container_image" {
  default = "nginx:latest" # Replace with your image
}

variable "subnet_ids" {
  type = list(string)
}

variable "security_group_id" {
  type = string
}
