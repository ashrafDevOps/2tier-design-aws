variable "lb_name" {
  description = "Name of the load balancer"
  type        = string
}

variable "tg_name" {
  description = "Name of the target group"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the ALB and TG will be created"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "lb_sg_id" {
  description = "Security group ID for the load balancer"
  type        = string
}

variable "backend_instance_ids" {
  description = "List of backend EC2 instance IDs to attach to the target group"
  type        = list(string)
}

variable "Is_private"{

type = bool


}





