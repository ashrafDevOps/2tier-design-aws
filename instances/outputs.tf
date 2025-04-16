output "bastion_public_ips" {
  description = "Menu Public IPs to  Bastion Instances"
  value       = aws_instance.bastion[*].public_ip
}

output "private_instance_ids" {
  description = "Menu IDs to  Private Instances"
  value       = aws_instance.private[*].id
}
output "instance_ids" {
  description = "List of EC2 instance IDs"
  value       = aws_instance.bastion[*].id  # Uses splat (*) to collect all IDs into a list
}

# output "load_blancer_dns" {
#   value = 
  
# }