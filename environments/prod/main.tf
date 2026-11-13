# Configuración del entorno de producción para el servicio de notificaciones
# Utiliza módulos de red y compute para aprovisionar la infraestructura

terraform {
  # Configuración de backend para estado remoto con locking
  backend "s3" {
    bucket = "notificaciones-terraform-state"
    key    = "prod/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "notificaciones-terraform-locks"
  }
}

# Módulo de red para producción
module "network" {
  source = "../../modules/network"

  # Consumir variables específicas de producción
  vpc_cidr              = var.prod_vpc_cidr
  public_subnet_cidrs  = var.prod_public_subnet_cidrs
  private_subnet_cidrs = var.prod_private_subnet_cidrs
  availability_zones   = var.prod_availability_zones
  environment          = var.environment
}

# Módulo de compute para producción
module "compute" {
  source = "../../modules/compute"

  # Consumir outputs del módulo de red
  vpc_id              = module.network.vpc_id
  public_subnet_ids   = module.network.subnet_ids
  private_subnet_ids  = module.network.subnet_ids

  # Variables específicas de producción - mayor capacidad
  cluster_name    = "${var.project_name}-cluster"
  environment     = var.environment
  desired_count   = var.prod_desired_count
  min_capacity    = var.prod_min_capacity
  max_capacity    = var.prod_max_capacity

  # Imagen y puerto del contenedor
  container_image = var.prod_container_image
  container_port  = var.prod_container_port
}

# Output para consumo en otros módulos o verificación
output "prod_network_info" {
  description = "Información de red del entorno de producción"
  value = {
    vpc_id           = module.network.vpc_id
    subnet_ids       = module.network.subnet_ids
    security_groups  = module.network.security_group_ids
  }
  sensitive = false
}

output "prod_compute_info" {
  description = "Información de compute del entorno de producción"
  value = {
    instance_ids             = module.compute.instance_ids
    autoscaling_group_name   = module.compute.autoscaling_group_name
  }
  sensitive = false
}

output "prod_instance_ids" {
  description = "IDs de las instancias del cluster de producción"
  value       = module.compute.instance_ids
  sensitive   = true
}

# TODO(reto): Implementar la configuración completa del entorno de producción
# - Configurar alta disponibilidad con múltiples AZs
# - Definir políticas de auto-scaling con métricas personalizadas
# - Añadir configuraciones de seguridad robustas (security groups restrictivos)
# - Configurar balanceador de carga con HTTPS
# - Implementar políticas de retención de logs
# - Configurar alarmasy métricas para producción
# - Definir variables de entorno con secretos externos
# - Añadir configuraciones de backup y disaster recovery