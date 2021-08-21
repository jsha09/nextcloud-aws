resource "aws_efs_file_system" "nextcloud-efs" {
  creation_token = "nextcloud-efs"
  lifecycle_policy {
    transition_to_ia = "AFTER_90_DAYS"
  }
  tags = {
    Name = "Nextcloud Storage"
  }
}

resource "aws_efs_mount_target" "nextcloud-mount-target" {
  count          = length(var.vpc_private_subnets)
  file_system_id = aws_efs_file_system.nextcloud-efs.id
  subnet_id      = element(var.vpc_private_subnets, count.index)
}
