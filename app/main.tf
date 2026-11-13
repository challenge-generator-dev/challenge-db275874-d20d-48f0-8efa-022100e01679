terraform {
  required_version = ">= 1.9.0, < 2.0.0"
}

locals {
  project_name = var.project_name
  common_tags  = var.tags
}

# Aprovisionamiento del módulo de red
module "network" {
  source = "../modules/network"

  vpc_cidr              = var.env_specific_vars.vpc_cidr
  public_subnet_cidrs  = var.env_specific_vars.public_subnet_cidrs
  private_subnet_cidrs = var.env_specific_vars.private_subnet_cidrs
  availability_zones   = var.env_specific_vars.availability_zones
  environment          = var.env_specific_vars.environment
}

# Aprovisionamiento del módulo de cómputo
module "compute" {
  source = "../modules/compute"

  cluster_name         = "${local.project_name}-${var.env_specific_vars.environment}"
  vpc_id               = module.network.vpc_id
  public_subnet_ids    = module.network.subnet_ids
  private_subnet_ids   = module.network.subnet_ids
  environment          = var.env_specific_vars.environment
  desired_count        = var.env_specific_vars.desired_count
  min_capacity         = var.env_specific_vars.min_capacity
  max_capacity         = var.env_specific_vars.max_capacity
  container_image      = var.container_image
  container_port       = var.container_port
}

# Outputs de la aplicación que consume los módulos
output "vpc_id" {
  description = "ID de la VPC creada"
  value       = module.network.vpc_id
}

output "subnet_ids" {
  description = "IDs de las subredes"
  value       = module.network.subnet_ids
}

output "security_group_ids" {
  description = "IDs de los grupos de seguridad"
  value       = module.network.security_group_ids
}

output "instance_ids" {
  description = "IDs de las instancias EC2 del clúster"
  value       = module.compute.instance_ids
  sensitive   = true
}

output "autoscaling_group_name" {
  description = "Nombre del grupo de auto-scaling"
  value       = module.compute.autoscaling_group_name
}