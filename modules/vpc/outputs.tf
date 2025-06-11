output "subnet_id_az1" {
  value = aws_subnet.public_subnet_az1.id
} 

output "subnet_id_az2" {
  value = aws_subnet.public_subnet_az2.id
}

output "vpc_id" {
  value = aws_vpc.vpc.id
} 