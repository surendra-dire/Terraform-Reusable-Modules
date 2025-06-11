

variable "description" {
  type        = string
  default     = "Description of the security group"
}

variable "vpc_id" {}

variable "allowed_ports" {
  type        = list(number)
  description = "List of TCP ports to allow for ingress"
  default     = []
}

variable "ingress_cidr_blocks" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "tags" {
  type        = map(string)
  default     = {}
}