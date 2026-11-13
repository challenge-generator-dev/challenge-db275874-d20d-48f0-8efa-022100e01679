# Variables comunes a todos los entornos
# Este archivo es el único dueño de env_specific_vars

variable "env_specific_vars" {
  description = "Variables específicas por entorno que se pasan desde terraform.tfvars"
  type = object({
    vpc_cidr            = string
    public_subnet_cidrs = list(string)
    private_subnet_cidrs = list(string)
    availability_zones  = list(string)
    environment         = string
    desired_count       = number
    min_capacity        = number
    max_capacity        = number
  })
}

# Variables comunes que no cambian entre entornos
variable "project_name" {
  description = "Nombre del proyecto"
  type        = string
  default     = "notificaciones-service"
}

variable "tags" {
  description = "Tags comunes para todos los recursos"
  type        = map(string)
  default = {
    Project     = "notificaciones-service"
    ManagedBy   = "Terraform"
    Environment = "global"
  }
}