# output "bastion_sg_id" {
#   description = "ID of the Bastion security group"
#   value       = var.create_bastion_sg ? aws_security_group.            bastion[0].id : null
# }


# output "private_sg_id" {
#   description = "ID of the Private instances security group"
#   value       = var.create_private_sg ? aws_security_group.private[0].id : null
# }

output "sg-id" {
  description = "get the security group id"
  value       = aws_security_group.sg.id
}