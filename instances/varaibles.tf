variable "ami_id" {
  description = "The AMI ID for instances"
  type        = string
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
}

variable "key_path" {
  description = "Local path to the private key"
  type        = string
}

variable "resource_name" {
  description = "Prefix for resource names"
  type        = string
}

# Bastion variables
variable "create_bastion" {
  description = "Whether to create bastion host"
  type        = bool
  default     = true
}

variable "bastion_instance_count" {
  description = "Number of bastion instances"
  type        = number
  default     = 1
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "bastion_sg_id" {
  description = "Security group ID for bastion"
  type        = string
}

# Private instances variables
variable "create_private" {
  description = "Whether to create private instances"
  type        = bool
  default     = true
}

variable "private_instance_count" {
  description = "Number of private instances"
  type        = number
  default     = 2
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "private_sg_id" {
  description = "Security group ID for private instances"
  type        = string
}

variable "load_blancer_dns" {
  
  
}

