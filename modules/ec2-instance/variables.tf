variable "project_name" {}
variable "ami" {}
variable "instance_type" {}
variable "subnet_id" {}

variable "security_group_ids" {
  type = list(string)
}

variable "ami_name_pattern" {
  description = "Pattern to match AMI names"
  type        = string
  default     = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
}
