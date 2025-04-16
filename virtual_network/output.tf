
output "vpc_id" {
  value = aws_vpc.main.id 
}

output "public_subnet_ids" {
  description = "Menu of Public Subnets_ID"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "Menu of  Private Subnets_ID"
  value       = aws_subnet.private[*].id
}

# output "nat_gateway_ips" {
#   description = " Public IP addresses of NAT Gateways"
#   value       = aws_eip.nat[*].public_ip
#   sensitive   = true
# }

output "public_route_table_id" {
  description = " Public Route Table ID "
  value       = aws_route_table.public.id
}

# output "private_route_table_ids" {
#   description = "List of  Private Route Tables IDss " 
#   value       = aws_route_table.private[*].id
# }