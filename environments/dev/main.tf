# Configuración del entorno de desarrollo para el servicio de notificaciones
# Superficie de práctica - stub para que el candidato implemente

terraform {
  backend "s3" {
    bucket = "notificaciones-terraform-state"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}

# Módulo de red para desarrollo
module "network" {
  source = "../../modules/network"

  vpc_cidr              = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
  environment          = var.environment
}

# Módulo de compute para desarrollo
module "compute" {
  source = "../../modules/compute"

  vpc_id            = module.network.vpc_id
  public_subnet_ids = module.network.subnet_ids
  private_subnet_ids = module.network.subnet_ids

  cluster_name    = "${var.project_name}-cluster"
  environment     = var.environment
  desired_count   = var.desired_count
  min_capacity    = var.min_capacity
  max_capacity    = var.max_capacity
}

# Output para consumo en otros módulos o verificación
output "dev_network_info" {
  description = "Información de red del entorno de desarrollo"
  value = {
    vpc_id           = module.network.vpc_id
    subnet_ids       = module.network.subnet_ids
    security_groups  = module.network.security_group_ids
  }
}

output "dev_compute_info" {
  description = "Información de compute del entorno de desarrollo"
  value = {
    instance_ids            = module.compute.instance_ids
    autoscaling_group_name  = module.compute.autoscaling_group_name
  }
}

# TODO(reto): Implementar la configuración completa del entorno de desarrollo
# - Ajustar valores de desired_count para desarrollo (menor que producción)
# - Configurar políticas de auto-scaling apropiadas para dev
# - Añadir configuraciones de seguridad específicas del entorno
# - Definir variables de entorno para el contenedor
# - Configurar logs y monitoring básico