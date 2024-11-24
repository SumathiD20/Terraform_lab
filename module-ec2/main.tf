
# ----------------------------------- Security Groups for the EC2 Instances -------------------------- #

# Security group for Public EC2 Instance

resource "aws_security_group" "Lab1FridayHITTPublicEC2InstanceSGrp" {
    vpc_id = aws_vpc.Lab1FridayHITTVPC.id
    description = "Allow SSH login to Public EC2 instance"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        security_groups = [aws_security_group.Lab1FridayHITTJumpBoxSGrp.id]
    }
    ingress {
        from_port = 80                                    #Allows HTTP connection
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 443                                  #Allows HTTPS connection
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 8
        to_port = 0
        protocol = "icmp"
        cidr_blocks = ["10.24.1.0/24"]
    }
    tags = {
        Name = "Lab2-PublicEC2SGrp"
    }
  
}

# Security Group for the Private EC2 instance in private subnet

resource "aws_security_group" "Lab1FridayHITTPrivateEC2InstanceSGrp" {
    vpc_id = aws_vpc.Lab1FridayHITTVPC.id
    description = "Allow SSH from the Jump Box from public subnet"

    ingress {                                                    #Allow SSH from jump box
        from_port = 22
        to_port = 22
        protocol = "tcp"
        security_groups = [aws_security_group.Lab1FridayHITTJumpBoxSGrp.id]
    }

    ingress {                                                    # Allow ping from jump box
        from_port = 8
        to_port = 0
        protocol = "icmp"
        cidr_blocks = ["10.24.0.0/24"]
    }

    tags = {
      Name = "Lab2-PrivateEC2SGrp"
    }

  
}

# Security group for Jump box in public subnet

resource "aws_security_group" "Lab1FridayHITTJumpBoxSGrp" {
    vpc_id = aws_vpc.Lab1FridayHITTVPC.id
    description = "Allow SSH to the jump host for specific IP range"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]                # Good to use VPN range
    }

    ingress {
        from_port = 8
        to_port = 0
        protocol = "icmp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }
    tags = {
      Name = "Lab2-JumpBoxEC2SGrp"
    }
  
}
# ------------------------------- EC2 Instances ------------------------------- #

# Public EC2 Instance

resource "aws_instance" "Lab1FridayHITTPublicEC2Instance" {
    instance_type = var.InstanstanceType
    key_name = var.KeyNameEC2
    ami = lookup(var.region_map, var.region)["AMI"]
    subnet_id = aws_subnet.Lab1FridayHITTPublicSubnet.id
    security_groups = [aws_security_group.Lab1FridayHITTPublicEC2InstanceSGrp.name]
    tags = {
      Name = "Lab2-PublicEC2Instance"
    
    }
  
}
# Private EC2 Instance

resource "aws_instance" "Lab1FridayHITTPrivateEC2Instance" {
    instance_type = var.InstanstanceType
    key_name = var.KeyNameEC2
    ami = lookup(var.region_map, var.region)["AMI"]
    subnet_id = aws_subnet.Lab1FridayHITTPrivateSubnet.id
    security_groups = [aws_security_group.Lab1FridayHITTPrivateEC2InstanceSGrp.name]
    tags = {
      Name = "Lab2-PrivateEC2Instance"
    
    }
  
}

# Jump Host Instance
resource "aws_instance" "Lab1FridayHITTJumpBox" {
  ami             = lookup(var.region_map, var.region)["AMI"]
  instance_type   = var.InstanstanceType
  key_name        = var.KeyNameEC2
  subnet_id       = aws_subnet.Lab1FridayHITTPublicSubnet.id
  security_groups = [aws_security_group.Lab1FridayHITTJumpBoxSGrp.name]

  tags = {
    Name = "Lab2-JumpBox"
  }
}