module "network" {
  source = "./modules/vpc"

  aws_region     = var.aws_region
  vpc_cidr       = var.vpc_cidr
  public_a_cidr  = var.public_a_cidr
  public_b_cidr  = var.public_b_cidr
  private_a_cidr = var.private_a_cidr
  private_b_cidr = var.private_b_cidr

  #instance_id = module.nextcloud-app.nextcloud_core_instance_id
}