# Variables específicas para el entorno de desarrollo
# TODO(reto): Definir valores específicos para el entorno dev
# Considerar:
# - CIDR blocks más pequeños para ahorrar costos
# - Menor capacidad de cómputo
# - Configuración de logging y monitoreo simplificada

variable "vpc_cidr" {
  description = "CIDR block para la VPC en desarrollo"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDRs para subnets públicas en desarrollo"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDRs para subnets privadas en desarrollo"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
  description = "AZs disponibles para desarrollo"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "environment" {
  description = "Nombre del ambiente"
  type        = string
  default     = "dev"
}

variable "desired_count" {
  description = "Número deseado de tareas en desarrollo"
  type        = number
  default     = 1
}

variable "min_capacity" {
  description = "Capacidad mínima en desarrollo"
  type        = number
  default     = 1
}

variable "max_capacity" {
  description = "Capacidad máxima en desarrollo"
  type        = number
  default     = 2
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