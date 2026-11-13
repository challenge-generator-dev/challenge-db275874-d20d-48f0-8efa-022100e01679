# Outputs del módulo de cómputo
# Provee los valores de cómputo necesarios para otros módulos

# TODO(reto): Implementar los outputs del módulo de cómputo
# El módulo de cómputo debe exponer:
# - instance_ids: IDs de las instancias EC2 del clúster
# - autoscaling_group_name: Nombre del grupo de auto-scaling
# Estos valores son necesarios para integración con otros servicios

output "instance_ids" {
  description = "IDs de las instancias EC2"
  value       = []
}

output "autoscaling_group_name" {
  description = "Nombre del grupo de auto-scaling"
  value       = ""
}