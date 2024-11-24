# Defining the variables for cidr blocks and region
# Variables
variable "VpcCidrparamBlock" {
  description = "Parameter Block for VPC CIDR"
  type        = string
  default     = "10.24.0.0/16"
}

variable "PublicSubnetCidrBlock" {
  description = "Parameter for Public Subnet Cidr"
  type        = string
  default     = "10.24.0.0/24"
}

variable "PrivateSubnetCidrBlock" {
  description = "Parameter for Private Subnet Cidr"
  type        = string
  default     = "10.24.1.0/24"
}

variable "region" {
  description = "AWS Region"
  default     = "us-east-1"
}