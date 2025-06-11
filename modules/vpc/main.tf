# =============================================================================
# Create vpc module
# =============================================================================

# Create a VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

# Get availability zone
data "aws_availability_zones" "availability_zone" {}

# Create a public subnet az1
resource "aws_subnet" "public_subnet_az1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.public_subnet_az1_cidr
  availability_zone = data.aws_availability_zones.availability_zone.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet_az1"
  }

}

# Create a public subnet az2
resource "aws_subnet" "public_subnet_az2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.public_subnet_az2_cidr
  availability_zone = data.aws_availability_zones.availability_zone.names[1]

  tags = {
    Name = "public_subnet_az2"
  }

}

resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.vpc.id

  ingress = []
  egress  = []
}

# Create internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

# Create route table
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"                   //"172.16.0.0/20"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
       Name = "${var.project_name}-rt"
  }
}

resource "aws_route_table_association" "rt_public_subnet_az1_association" {
  subnet_id      = aws_subnet.public_subnet_az1.id
  route_table_id = aws_route_table.rt.id
}