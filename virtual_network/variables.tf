
variable "vpc_cidr" {
  description = "Main CIDR block to VPC "
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = " Main CIDR blocks to  Public Subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "Main CIDR blocks to  Private Subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "azs" {
  description = "Main Availability Zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "enable_nat_gateway" {
  description = "Enable NAT Gateways to Private Subnets"
  type        = bool
  default     = true
}
