# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener el proyecto completo y arrancable. Guarda los archivos que te devuelva en la
carpeta del repo, respetando exactamente las rutas.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Superficie de practica — NO resuelvas

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs.

- `modules/network/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/network/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/network/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/compute/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/compute/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/compute/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `environments/dev/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `environments/dev/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `environments/prod/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `environments/prod/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.

## Como saber que terminaste

```bash
terraform -chdir=app init -backend=false && terraform init -backend=false && terraform -chdir=environments init -backend=false && terraform -chdir=environments/dev init -backend=false && terraform -chdir=environments/prod init -backend=false && terraform -chdir=modules/compute init -backend=false && terraform -chdir=modules/network init -backend=false && terraform -chdir=app validate && terraform validate && terraform -chdir=environments validate && terraform -chdir=environments/dev validate && terraform -chdir=environments/prod validate && terraform -chdir=modules/compute validate && terraform -chdir=modules/network validate
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Perfil
Chapter DevOps, Especialidad Ingenieria, Tecnología Terraform, Advanced L2

### Brecha de conocimiento
Aprovisionar infraestructura con Terraform, Aprovisiona con Terraform la red y el computo del servicio de notificaciones

### Misión / candidato
Versionar la infraestructura del servicio de notificaciones

### Reto
- Tema: Infraestructura como codigo con Terraform
- Seniority: advanced-l2
- Tipo: practical
- Título: Versionamiento de Infraestructura para Servicio de Notificaciones
- Tiempo estimado: 8 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Configuración Inicial de Terraform — objetivo: Configurar el entorno de Terraform para gestionar la infraestructura del servicio de notificaciones. — entregable (NO resolver): Configuración de Terraform lista para aprovisionar la infraestructura.
- Fase 2: Aprovisionamiento de la Red — objetivo: Aprovisionar la red necesaria para el servicio de notificaciones utilizando Terraform. — entregable (NO resolver): Red aprovisionada y documentada utilizando Terraform.
- Fase 3: Aprovisionamiento del Clúster de Computación — objetivo: Aprovisionar el clúster de computación necesario para el servicio de notificaciones utilizando Terraform. — entregable (NO resolver): Clúster de computación aprovisionado y documentado utilizando Terraform.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (entrega de archivos).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Entrega de archivos
Entregá cada archivo con su ruta completa, respetando exactamente la estructura de rutas
indicada por los marcadores: un bloque por archivo, precedido por su ruta. No generes ZIPs
ni archivos adjuntos.
La entrega debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: Entregá los archivos completos al finalizar. No preguntes si el usuario
quiere recibirlos. Simplemente entregalos; No debes desplegar en el chat el resumen de lo que arreglaste, solo entregá los archivos.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del último archivo entregado
No preguntes si el usuario quiere los archivos: simplemente entregalos siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: versions.tf ===
terraform {
  required_version = ">= 1.9.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.100.0"
    }
  }
}

// === ARCHIVO: providers.tf ===
provider "aws" {
  region = "us-east-1"
}

// === ARCHIVO: modules/network/main.tf ===
# Módulo de red para el servicio de notificaciones
# TODO(reto): Implementar la infraestructura de red (VPC, subnets, security groups, etc.)
# Requisitos:
# - VPC con CIDR 10.0.0.0/16
# - Subnets públicas y privadas en al menos 2 AZs
# - Internet Gateway y NAT Gateway para salida a Internet
# - Security Groups para controlar el tráfico
# - Outputs: vpc_id, public_subnet_ids, private_subnet_ids



// === ARCHIVO: modules/network/variables.tf ===
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

// === ARCHIVO: modules/compute/main.tf ===
# Módulo de cómputo para el servicio de notificaciones
# TODO(reto): Implementar la infraestructura de cómputo (ECS cluster, EC2 instances, etc.)
# Requisitos:
# - Cluster ECS con capacidad para ejecutar servicios de notificaciones
# - Auto Scaling Group para manejar la carga
# - Load Balancer para distribuir tráfico
# - Security Groups para el cluster
# - Outputs: cluster_id, service_name, load_balancer_dns



// === ARCHIVO: modules/compute/variables.tf ===
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

// === ARCHIVO: environments/dev/variables.tf ===
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

// === ARCHIVO: environments/variables.tf ===
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

// === ARCHIVO: modules/network/outputs.tf ===
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

// === ARCHIVO: modules/compute/outputs.tf ===
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

// === ARCHIVO: environments/dev/main.tf ===
# Configuración del entorno de desarrollo para el servicio de notificaciones
# Superficie de práctica - stub para que el candidato implemente

terraform {
  backend "s3" {
    bucket = "notificaciones-terraform-state"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}

# Módulo de red para desarrollo
module "network" {
  source = "../../modules/network"

  vpc_cidr              = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
  environment          = var.environment
}

# Módulo de compute para desarrollo
module "compute" {
  source = "../../modules/compute"

  vpc_id            = module.network.vpc_id
  public_subnet_ids = module.network.subnet_ids
  private_subnet_ids = module.network.subnet_ids

  cluster_name    = "${var.project_name}-cluster"
  environment     = var.environment
  desired_count   = var.desired_count
  min_capacity    = var.min_capacity
  max_capacity    = var.max_capacity
}

# Output para consumo en otros módulos o verificación
output "dev_network_info" {
  description = "Información de red del entorno de desarrollo"
  value = {
    vpc_id           = module.network.vpc_id
    subnet_ids       = module.network.subnet_ids
    security_groups  = module.network.security_group_ids
  }
}

output "dev_compute_info" {
  description = "Información de compute del entorno de desarrollo"
  value = {
    instance_ids            = module.compute.instance_ids
    autoscaling_group_name  = module.compute.autoscaling_group_name
  }
}

# TODO(reto): Implementar la configuración completa del entorno de desarrollo
# - Ajustar valores de desired_count para desarrollo (menor que producción)
# - Configurar políticas de auto-scaling apropiadas para dev
# - Añadir configuraciones de seguridad específicas del entorno
# - Definir variables de entorno para el contenedor
# - Configurar logs y monitoring básico

// === ARCHIVO: environments/prod/main.tf ===
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

// === ARCHIVO: environments/prod/variables.tf ===
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

// === ARCHIVO: app/main.tf ===
terraform {
  required_version = ">= 1.9.0, < 2.0.0"
}

locals {
  project_name = var.project_name
  common_tags  = var.tags
}

# Aprovisionamiento del módulo de red
module "network" {
  source = "../modules/network"

  vpc_cidr              = var.env_specific_vars.vpc_cidr
  public_subnet_cidrs  = var.env_specific_vars.public_subnet_cidrs
  private_subnet_cidrs = var.env_specific_vars.private_subnet_cidrs
  availability_zones   = var.env_specific_vars.availability_zones
  environment          = var.env_specific_vars.environment
}

# Aprovisionamiento del módulo de cómputo
module "compute" {
  source = "../modules/compute"

  cluster_name         = "${local.project_name}-${var.env_specific_vars.environment}"
  vpc_id               = module.network.vpc_id
  public_subnet_ids    = module.network.subnet_ids
  private_subnet_ids   = module.network.subnet_ids
  environment          = var.env_specific_vars.environment
  desired_count        = var.env_specific_vars.desired_count
  min_capacity         = var.env_specific_vars.min_capacity
  max_capacity         = var.env_specific_vars.max_capacity
  container_image      = var.container_image
  container_port       = var.container_port
}

# Outputs de la aplicación que consume los módulos
output "vpc_id" {
  description = "ID de la VPC creada"
  value       = module.network.vpc_id
}

output "subnet_ids" {
  description = "IDs de las subredes"
  value       = module.network.subnet_ids
}

output "security_group_ids" {
  description = "IDs de los grupos de seguridad"
  value       = module.network.security_group_ids
}

output "instance_ids" {
  description = "IDs de las instancias EC2 del clúster"
  value       = module.compute.instance_ids
  sensitive   = true
}

output "autoscaling_group_name" {
  description = "Nombre del grupo de auto-scaling"
  value       = module.compute.autoscaling_group_name
}

// === ARCHIVO: app/variables.tf ===
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
```
