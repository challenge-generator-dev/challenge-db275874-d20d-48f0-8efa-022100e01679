# Variables específicas del entorno de producción
# Estas variables complementan las variables base definidas en environments/variables.tf

variable "prod_vpc_cidr" {
  description = "CIDR block para la VPC de producción"
  type        = string
  default     = "10.1.0.0/16"
  validation {
    condition     = can(cidrhost(var.prod_vpc_cidr, 0))
    error_message = "El CIDR de VPC debe ser una dirección de red válida."
  }
}

variable "prod_public_subnet_cidrs" {
  description = "CIDR blocks para las subnets públicas de producción"
  type        = list(string)
  default     = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
}

variable "prod_private_subnet_cidrs" {
  description = "CIDR blocks para las subnets privadas de producción"
  type        = list(string)
  default     = ["10.1.10.0/24", "10.1.11.0/24", "10.1.12.0/24"]
}

variable "prod_availability_zones" {
  description = "Zonas de disponibilidad para producción"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "prod_desired_count" {
  description = "Número deseado de tareas del servicio en producción"
  type        = number
  default     = 3
}

variable "prod_min_capacity" {
  description = "Capacidad mínima del auto scaling en producción"
  type        = number
  default     = 3
}

variable "prod_max_capacity" {
  description = "Capacidad máxima del auto scaling en producción"
  type        = number
  default     = 10
}

variable "prod_container_image" {
  description = "Imagen del contenedor para producción"
  type        = string
  default     = "notificaciones-service:prod-latest"
}

variable "prod_container_port" {
  description = "Puerto del contenedor en producción"
  type        = number
  default     = 8080
}

variable "prod_enable_deletion_protection" {
  description = "Habilitar protección contra eliminación en producción"
  type        = bool
  default     = true
}

variable "prod_health_check_path" {
  description = "Path del health check para el servicio"
  type        = string
  default     = "/health"
}

variable "prod_health_check_interval" {
  description = "Intervalo de health check en segundos"
  type        = number
  default     = 30
}

variable "environment" {
  description = "Nombre del ambiente"
  type        = string
  default     = "prod"
}

variable "tags" {
  description = "Tags comunes para todos los recursos"
  type        = map(string)
  default     = {}
}

variable "project_name" {
  description = "Nombre del proyecto para identificar recursos"
  type        = string
  default     = "notificaciones-service"
}

# TODO(reto): Añadir variables específicas de producción según necesidades
# - Variables de configuración de seguridad (SSL certificates, policies)
# - Variables de monitoring y alertas
# - Variables de backup y recuperación
# - Variables de red avanzadas (NAT Gateway, VPC endpoints)