# Variables de entrada para el módulo de red
# TODO(reto): Definir variables necesarias para configurar la red
# Considerar:
# - CIDR blocks para VPC y subnets
# - AZs disponibles
# - Tags para recursos
# - Configuración de NAT Gateway (single o por AZ)

variable "vpc_cidr" {
  description = "CIDR block para la VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Lista de CIDRs para subnets públicas"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Lista de CIDRs para subnets privadas"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
  description = "Lista de AZs donde crear las subnets"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "environment" {
  description = "Ambiente donde se despliega la infraestructura"
  type        = string
}