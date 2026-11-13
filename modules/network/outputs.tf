# Outputs del módulo de red
# Provee los valores de red necesarios para otros módulos

# TODO(reto): Implementar los outputs del módulo de red
# El módulo de red debe exponer:
# - vpc_id: ID de la VPC creada
# - subnet_ids: IDs de las subnets creadas (públicas y privadas)
# - security_group_ids: IDs de los security groups creados
# Estos valores son consumidos por el módulo de compute

output "vpc_id" {
  description = "ID de la VPC"
  value       = ""
}

output "subnet_ids" {
  description = "IDs de las subnets"
  value       = []
}

output "security_group_ids" {
  description = "IDs de los security groups"
  value       = []
}