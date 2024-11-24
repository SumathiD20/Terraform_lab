# variable block for keyname

variable "KeyNameEC2" {
  description = "Enter the keyname for EC2 instance"
  type        = string
}

variable "InstanstanceType" {
    description = "select if t2.micro or t2.nano"
    type = string
    default = "t2.micro"
  
}

# Declare region_map variable to map region names to AMI IDs
variable "region_map" {
  description = "Map of regions to AMI IDs"
  type = map(object({
    AMI = string
  }))
  default = {
    "us-east-1" = {
      AMI = "ami-0fff1b9a61dec8a5f"
    },
    "us-west-1" = {
      AMI = "ami-0cf4e1fcfd8494d5b"
    }
  }
}