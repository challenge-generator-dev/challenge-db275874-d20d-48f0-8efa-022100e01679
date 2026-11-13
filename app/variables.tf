variable "project_name" {
  type        = string
  description = "Nombre del proyecto para identificar recursos"
  default     = "notificaciones-service"
}

variable "tags" {
  type        = map(string)
  description = "Tags comunes para todos los recursos"
  default = {
    ManagedBy = "Terraform"
    Project   = "notificaciones-service"
  }
}

variable "env_specific_vars" {
  type = object({
    vpc_cidr              = string
    public_subnet_cidrs  = list(string)
    private_subnet_cidrs = list(string)
    availability_zones   = list(string)
    environment          = string
    desired_count        = number
    min_capacity         = number
    max_capacity         = number
  })
  description = "Variables específicas del entorno"
}

variable "container_image" {
  type        = string
  description = "Imagen del contenedor a desplegar"
  default     = "notificaciones-service:latest"
}

variable "container_port" {
  type        = number
  description = "Puerto del contenedor"
  default     = 8080
}