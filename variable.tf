# variables.tf

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "dev_private_subnets_cidr" {
  description = "CIDR blocks for dev private subnets"
  default = [
    "10.0.0.0/18",
    "10.0.64.0/18",
    "10.0.128.0/18",
  ]
}

variable "dev_data_subnets_cidr" {
  description = "CIDR blocks for dev data subnets"
  default = [
    "10.0.192.0/21",
    "10.0.200.0/21",
    "10.0.208.0/21",
  ]
}

variable "dev_public_subnets_cidr" {
  description = "CIDR blocks for dev public subnets"
  default = [
    "10.0.216.0/21",
    "10.0.224.0/21",
    "10.0.232.0/21",
  ]
}
