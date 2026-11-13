# Variables de entrada para el módulo de cómputo
# TODO(reto): Definir variables necesarias para configurar el cómputo
# Considerar:
# - Configuración del cluster (nombre, capacidad)
# - Configuración de Auto Scaling
# - Imagen de Docker para el servicio
# - Variables de entorno para el servicio
# - Tags para recursos

variable "cluster_name" {
  description = "Nombre del cluster ECS"
  type        = string
}

variable "vpc_id" {
  description = "ID de la VPC donde se desplegará el cluster"
  type        = string
}

variable "public_subnet_ids" {
  description = "IDs de las subnets públicas para el Load Balancer"
  type        = list(string)
  default     = []
}

variable "private_subnet_ids" {
  description = "IDs de las subnets privadas para el cluster"
  type        = list(string)
  default     = []
}

variable "environment" {
  description = "Ambiente donde se despliega la infraestructura"
  type        = string
}

variable "desired_count" {
  description = "Número deseado de tareas en el servicio"
  type        = number
  default     = 2
}

variable "min_capacity" {
  description = "Capacidad mínima del Auto Scaling Group"
  type        = number
  default     = 2
}

variable "max_capacity" {
  description = "Capacidad máxima del Auto Scaling Group"
  type        = number
  default     = 4
}

variable "container_image" {
  description = "Imagen de Docker para el servicio de notificaciones"
  type        = string
  default     = "notifications-service:latest"
}

variable "container_port" {
  description = "Puerto expuesto por el contenedor"
  type        = number
  default     = 8080
}