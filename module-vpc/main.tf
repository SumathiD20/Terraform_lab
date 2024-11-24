
#Creating Virtual private cloud (VPC) for FridayHITT company

resource "aws_vpc" "Lab1FridayHITTVPC" {
    cidr_block = var.VpcCidrparamBlock
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
        Name = "Lab2-VPC"
    }
}

# Configuring Internet gateway
resource "aws_internet_gateway" "Lab1FridayHITTInternetGateway" {
    vpc_id = aws_vpc.Lab1FridayHITTVPC.id
    tags = {
        Name = "Lab2-InternetGateway"
    }
}

# ------------------------------- Public and Private subnet --------------------------#

# Public subnet of FridayHITT

resource "aws_subnet" "Lab1FridayHITTPublicSubnet" {
    vpc_id = aws_vpc.Lab1FridayHITTVPC.id
    cidr_block = var.PublicSubnetCidrBlock
    availability_zone = data.aws_availability_zones.available.names[1]
    map_public_ip_on_launch = true
    tags = {
        Name = "Lab2-PublicSubnet"
    }
}

# Private subnet for FridayHITT
resource "aws_subnet" "Lab1FridayHITTPrivateSubnet" {
    vpc_id = aws_vpc.Lab1FridayHITTVPC.id
    cidr_block = var.PrivateSubnetCidrBlock
    availability_zone = data.aws_availability_zones.available.names[1]
    tags = {
        Name = "Lab2-PrivateSubnet"
    }
}

# ------------------------ Routes for Public and Private Subnet ---------------------#

# Route table for Public subnet

resource "aws_route_table" "Lab1FridayHITTPublicRouteTable" {
    vpc_id = aws_vpc.Lab1FridayHITTVPC.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.Lab1FridayHITTInternetGateway.id
    }
    tags = {
        Name = "Lab2-PublicRouteTable"
    }
  
}

# Route Table Association for Public Subnet
resource "aws_route_table_association" "Lab1FridayHITTPublicSubnetRouteTableAssociation" {
    subnet_id = aws_subnet.Lab1FridayHITTPublicSubnet.id
    route_table_id = aws_route_table.Lab1FridayHITTPublicRouteTable.id
  
}

# Route table for private subnet
resource "aws_route_table" "Lab1FridayHITTPrivateRouteTable" {
    vpc_id = aws_vpc.Lab1FridayHITTVPC.id
    tags = {
      Name = "Lab2-PrivateRouteTable"
    }
  
}

#Route Table Association for Private Subnet
resource "aws_route_table_association" "Lab1FridayHITTPrivateSubnetRouteTableAssociation" {
    subnet_id = aws_subnet.Lab1FridayHITTPrivateSubnet.id
    route_table_id = aws_route_table.Lab1FridayHITTPrivateRouteTable.id
  
}