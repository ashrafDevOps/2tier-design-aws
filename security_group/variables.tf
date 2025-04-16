variable "vpc_id" {
  description = "ID of the VPC where security groups will be created"
  type        = string
}

# variable "vpc_cidr_block" {
#   description = "CIDR block of the VPC"
#   type        = string
# }

variable "resource_prefix" {
  description = "Prefix for resource names"
  type        = string
  default     = "my-app"
}

variable "create_bastion_sg" {
  description = "Whether to create Bastion security group"
  type        = bool
  default     = true
}

variable "create_private_sg" {
  description = "Whether to create Private instances security group"
  type        = bool
  default     = true
}

variable "bastion_ingress_cidr_blocks" {
  description = "List of CIDR blocks allowed to access Bastion"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}