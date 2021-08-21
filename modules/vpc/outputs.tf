output "vpc_id" {
  value = aws_vpc.nextcloud_vpc.id
}

output "public_subnet_a_id" {
  value = aws_subnet.nextcloud_public_subnet_a.id
}

output "public_subnet_b_id" {
  value = aws_subnet.nextcloud_public_subnet_b.id
}

output "private_subnet_a_id" {
  value = aws_subnet.nextcloud_private_subnet_a.id
}

output "private_subnet_b_id" {
  value = aws_subnet.nextcloud_private_subnet_b.id
}

output "db_subnet_group" {
  value = aws_db_subnet_group.nextcloud_db_subnet_grp.id
}