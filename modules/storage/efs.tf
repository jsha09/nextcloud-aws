resource "aws_efs_file_system" "nextcloud-efs" {
  creation_token = "nextcloud-efs"
  lifecycle_policy {
    transition_to_ia = "AFTER_90_DAYS"
  }
  tags = {
    Name = "Nextcloud Storage"
  }
}

resource "aws_security_group_rule" "nexclous_efs_sg_ingress" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.efs-sg.id
}

resource "aws_security_group_rule" "nexclous_efs_sg_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.efs-sg.id
}

resource "aws_security_group" "efs-sg" {
  name        = "efs-security-group"
  description = "EFS Security Group"
  vpc_id      = var.vpc_id

  tags = {
    Name = "Nextcloud EFS Security Group"
  }
}

resource "aws_efs_mount_target" "nextcloud-mount-target" {
  count           = length(var.vpc_private_subnets)
  file_system_id  = aws_efs_file_system.nextcloud-efs.id
  subnet_id       = element(var.vpc_private_subnets, count.index)
  security_groups = [aws_security_group.efs-sg.id]
}
