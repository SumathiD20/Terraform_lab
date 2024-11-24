
# contains output information of the cloud resources of FridayHITT company.
output "VpcId" {
  description = "VPC ID of FridayHITT company"
  value       = aws_vpc.Lab1FridayHITTVPC.id
}

output "InternetGateway" {
  description = "Internet Gateway for FridayHITT company VPC"
  value       = aws_internet_gateway.Lab1FridayHITTInternetGateway.id
}

output "PublicSubnet" {
  description = "Public Subnet of FridayHITT company VPC"
  value       = aws_subnet.Lab1FridayHITTPublicSubnet.id
}

output "PrivateSubnet" {
  description = "Private Subnet of FridayHITT company VPC"
  value       = aws_subnet.Lab1FridayHITTPrivateSubnet.id
}