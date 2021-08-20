# variable "instance_id" {
#     description = "Instance id to assign the Elastic IP to"
# }
variable "aws_region" {
  description = "Region where to deploy the Nextcloud application and the database"
}
variable "vpc_cidr" {
  description = "CIDR of the VPC"
}

variable "public_a_cidr" {
  description = "CIDR of the public subnet"
}

variable "public_b_cidr" {
  description = "CIDR of the public subnet"
}

variable "private_a_cidr" {
  description = "CIDR of the private subnet"
}

variable "private_b_cidr" {
  description = "CIDR of the private subnet"
}