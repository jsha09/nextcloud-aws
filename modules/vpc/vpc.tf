resource "aws_vpc" "nextcloud_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = "Nextcloud VPC"
  }
}

# Public subnets
resource "aws_subnet" "nextcloud_public_subnet_a" {
  vpc_id = aws_vpc.nextcloud_vpc.id
  cidr_block = var.public_a_cidr
  availability_zone = "${var.aws_region}a"
  tags = {
    Name = "Nextcloud public subnet A"
  }
}

resource "aws_subnet" "nextcloud_public_subnet_b" {
  vpc_id = aws_vpc.nextcloud_vpc.id
  cidr_block = var.public_b_cidr
  availability_zone = "${var.aws_region}b"
  tags = {
    Name = "Nextcloud public subnet B"
  }
}

# Private subnets
resource "aws_subnet" "nextcloud_private_subnet_a" {
  vpc_id = aws_vpc.nextcloud_vpc.id
  cidr_block = var.private_a_cidr
  availability_zone = "${var.aws_region}a"
  tags = {
    Name = "Nextcloud private subnet A"
  }
}

resource "aws_subnet" "nextcloud_private_subnet_b" {
  vpc_id = aws_vpc.nextcloud_vpc.id
  cidr_block = var.private_b_cidr
  availability_zone = "${var.aws_region}b"
  tags = {
    Name = "Nextcloud private subnet B"
  }
}

resource "aws_db_subnet_group" "nextcloud_db_subnet_grp" {
  name       = "nextcloud db subnet group"
  subnet_ids = [aws_subnet.nextcloud_private_subnet_a.id, aws_subnet.nextcloud_private_subnet_b.id]

  tags = {
    Name = "Nextcloud db subnet group"
  }
}

# Internet gateway
resource "aws_internet_gateway" "nextcloud_vpc_igw" {
  vpc_id = aws_vpc.nextcloud_vpc.id
  tags = {
    Name = "Nextcloud internet gateway"
  }
}

# Route table
resource "aws_route_table" "nextcloud_public_route_table" {
  vpc_id = aws_vpc.nextcloud_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.nextcloud_vpc_igw.id
  }

  tags = {
    Name = "Nextcloud route table"
  }
}

resource "aws_route_table_association" "nextcloud_public_rt_assoc_a" {
  subnet_id = aws_subnet.nextcloud_public_subnet_a.id
  route_table_id = aws_route_table.nextcloud_public_route_table.id
}

resource "aws_route_table_association" "nextcloud_public_rt_assoc_b" {
  subnet_id = aws_subnet.nextcloud_public_subnet_b.id
  route_table_id = aws_route_table.nextcloud_public_route_table.id
}