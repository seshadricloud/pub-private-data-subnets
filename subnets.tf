# subnets/dev_subnets.tf

# Define VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "MyVPC"
  }
}

# Define subnet CIDR blocks
variable "dev_private_subnets" {
  default = [
    "10.0.0.0/18",
    "10.0.64.0/18",
    "10.0.128.0/18",
  ]
}

variable "dev_data_subnets" {
  default = [
    "10.0.192.0/21",
    "10.0.200.0/21",
    "10.0.208.0/21",
  ]
}

variable "dev_public_subnets" {
  default = [
    "10.0.216.0/21",
    "10.0.224.0/21",
    "10.0.232.0/21",
  ]
}

# Create private subnets
resource "aws_subnet" "dev_private_subnet" {
  count                   = length(var.dev_private_subnets)
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.dev_private_subnets[count.index]
  availability_zone       = element(["us-east-1a", "us-east-1b", "us-east-1c"], count.index)
  map_public_ip_on_launch = false

  tags = {
    Name = "dev-private-${count.index + 1}-subnet${count.index + 1}"
  }
}

# Create data subnets
resource "aws_subnet" "dev_data_subnet" {
  count                   = length(var.dev_data_subnets)
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.dev_data_subnets[count.index]
  availability_zone       = element(["us-east-1a", "us-east-1b", "us-east-1c"], count.index)

  tags = {
    Name = "dev-data-${count.index + 1}-subnet${count.index + 1}"
  }
}

# Create public subnets
resource "aws_subnet" "dev_public_subnet" {
  count                   = length(var.dev_public_subnets)
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.dev_public_subnets[count.index]
  availability_zone       = element(["us-east-1a", "us-east-1b", "us-east-1c"], count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "dev-public-${count.index + 1}-subnet${count.index + 1}"
  }
}
