variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
}

variable "availability_zone" {
  description = "AZ for public subnet"
  type        = string
}

variable "vpc_name" {
  description = "Name tag for VPC"
  type        = string
}
