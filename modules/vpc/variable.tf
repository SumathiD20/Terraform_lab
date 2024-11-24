# Defining the variables for cidr blocks and region
# Variables
variable "VpcCidrparamBlock" {
  description = "Parameter Block for VPC CIDR"
  type        = string
  
}

variable "PublicSubnetCidrBlock" {
  description = "Parameter for Public Subnet Cidr"
  type        = string
  
}

variable "PrivateSubnetCidrBlock" {
  description = "Parameter for Private Subnet Cidr"
  type        = string
  
}

