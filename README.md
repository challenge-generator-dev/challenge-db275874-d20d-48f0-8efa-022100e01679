# Versionamiento de Infraestructura para Servicio de Notificaciones

El objetivo de este reto es versionar la infraestructura del servicio de notificaciones utilizando Terraform. El servicio de notificaciones requiere una red y un clúster de computación aprovisionados. El candidato deberá utilizar Terraform para gestionar y versionar esta infraestructura.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | Infraestructura como codigo con Terraform |
| **Nivel** | advanced-l2 |
| **Tipo** | practical |
| **Tiempo estimado** | 8 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y entregará cada archivo con su ruta.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: Un IDE o editor de código.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y entregará cada archivo con su ruta. Guárdalos en la carpeta donde quieras trabajar, respetando las rutas.
- Verifica que el proyecto arranca sin errores.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no entrega todos los archivos al terminar el análisis, escríbele: "entrégame todos los archivos con su ruta".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Configuración Inicial de Terraform

**Objetivo:** Configurar el entorno de Terraform para gestionar la infraestructura del servicio de notificaciones.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- Configurar el entorno de Terraform para gestionar la infraestructura del servicio de notificaciones.
- Identificar los componentes necesarios para la red y el clúster de computación.
- Definir los recursos de Terraform para aprovisionar la red y el clúster de computación.

**Entregable:** Configuración de Terraform lista para aprovisionar la infraestructura.

<details>
<summary>Pistas de conocimiento</summary>

- Utilizar el comando `terraform init` para inicializar el entorno de Terraform.
- Definir los recursos de Terraform en archivos `.tf`.

</details>

### Fase 2: Aprovisionamiento de la Red

**Objetivo:** Aprovisionar la red necesaria para el servicio de notificaciones utilizando Terraform.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Utilizar Terraform para aprovisionar la red del servicio de notificaciones.
- Verificar que la red se aprovisiona correctamente y está disponible para uso.
- Documentar el proceso de aprovisionamiento de la red.

**Entregable:** Red aprovisionada y documentada utilizando Terraform.

<details>
<summary>Pistas de conocimiento</summary>

- Utilizar el comando `terraform apply` para aprovisionar la red.
- Verificar la disponibilidad de la red utilizando herramientas de diagnóstico.

</details>

### Fase 3: Aprovisionamiento del Clúster de Computación

**Objetivo:** Aprovisionar el clúster de computación necesario para el servicio de notificaciones utilizando Terraform.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Utilizar Terraform para aprovisionar el clúster de computación del servicio de notificaciones.
- Verificar que el clúster de computación se aprovisiona correctamente y está disponible para uso.
- Documentar el proceso de aprovisionamiento del clúster de computación.

**Entregable:** Clúster de computación aprovisionado y documentado utilizando Terraform.

<details>
<summary>Pistas de conocimiento</summary>

- Utilizar el comando `terraform apply` para aprovisionar el clúster de computación.
- Verificar la disponibilidad del clúster de computación utilizando herramientas de diagnóstico.

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es Terraform y cómo se utiliza para versionar la infraestructura?
- **paraQueSirve**: ¿Para qué sirve versionar la infraestructura con Terraform?
- **comoSeUsa**: ¿Cómo se utiliza Terraform para aprovisionar la red y el clúster de computación?
- **erroresComunes**: ¿Cuáles son los errores comunes al aprovisionar infraestructura con Terraform?

## Criterios de Evaluacion

- Configuración inicial de Terraform.
- Aprovisionamiento de la red.
- Aprovisionamiento del clúster de computación.
- Documentación del proceso de aprovisionamiento.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT) si no tenes un agente en el IDE. Declara lo mismo que AGENTS.md; los archivos que te devuelva el chat los guardas en esta carpeta respetando las rutas.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
terraform -chdir=app init -backend=false && terraform init -backend=false && terraform -chdir=environments init -backend=false && terraform -chdir=environments/dev init -backend=false && terraform -chdir=environments/prod init -backend=false && terraform -chdir=modules/compute init -backend=false && terraform -chdir=modules/network init -backend=false && terraform -chdir=app validate && terraform validate && terraform -chdir=environments validate && terraform -chdir=environments/dev validate && terraform -chdir=environments/prod validate && terraform -chdir=modules/compute validate && terraform -chdir=modules/network validate
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
