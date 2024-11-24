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


# variable block for keyname

variable "KeyNameEC2" {
  description = "Enter the keyname for EC2 instance"
  type        = string
}

variable "InstanstanceType" {
    description = "select if t2.micro or t2.nano"
    type = string
    
}

#Variable to specify the access and secret keys

variable "access_key" {
    description = "access_key for AWS"
  
}
variable "secret_key" {
    description = "secret_key for AWS"
  
}

# variable for region and AMI ID

variable "region" {
    description = "region of the infrastructure"
}
variable "ami_id" {
    description = "ami ID of the infrastructure"
  
}
  