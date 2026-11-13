# Módulo de red para el servicio de notificaciones
# TODO(reto): Implementar la infraestructura de red (VPC, subnets, security groups, etc.)
# Requisitos:
# - VPC con CIDR 10.0.0.0/16
# - Subnets públicas y privadas en al menos 2 AZs
# - Internet Gateway y NAT Gateway para salida a Internet
# - Security Groups para controlar el tráfico
# - Outputs: vpc_id, public_subnet_ids, private_subnet_ids