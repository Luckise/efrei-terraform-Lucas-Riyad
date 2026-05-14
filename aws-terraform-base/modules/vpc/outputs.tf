output "vpc_id" {
  description = "ID du VPC créé"
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "CIDR du VPC"
  value       = aws_vpc.main.cidr_block
}

output "subnet_public_id" {
  description = "ID du subnet public"
  value       = aws_subnet.public.id
}

output "subnet_public_cidr" {
  description = "CIDR du subnet public"
  value       = aws_subnet.public.cidr_block
}

output "internet_gateway_id" {
  description = "ID du Internet Gateway"
  value       = aws_internet_gateway.main.id
}

output "route_table_id" {
  description = "ID de la route table publique"
  value       = aws_route_table.public.id
}
