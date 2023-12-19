# outputs.tf

output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "dev_private_subnet_ids" {
  value = aws_subnet.dev_private_subnet[*].id
}

output "dev_data_subnet_ids" {
  value = aws_subnet.dev_data_subnet[*].id
}

output "dev_public_subnet_ids" {
  value = aws_subnet.dev_public_subnet[*].id
}
