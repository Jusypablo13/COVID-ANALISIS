---

# Análisis de Variantes del COVID-19

## Descripción

Este proyecto realiza un análisis de variantes del COVID-19 utilizando el lenguaje de programación R. El objetivo es extraer las secuencias genéticas de las variantes y determinar qué tan relacionadas están entre sí. Los datos se procesan a partir de archivos FASTA y se generan resultados visuales y estadísticos sobre la similitud de las variantes.

## Requisitos

- **Lenguaje de programación**: R
- **Paquetes de R necesarios**:
  - `Biostrings` (para trabajar con secuencias genéticas)
  - `ape` (para el análisis filogenético)
  - Otros paquetes como `ggplot2` para visualización de datos

## Archivos incluidos

- **`sequencias.fasta`**: Archivo que contiene las secuencias genéticas de las variantes del COVID-19.
- **`EVIDENCIA_FINAL.Rmd`**: Archivo de Markdown generado por R que contiene el código y las salidas del análisis.
- **`FINAL.r`**: Script de R que realiza el análisis de las secuencias y genera los resultados de similitud y relación entre variantes.

## Instrucciones de Uso

1. Instalar R y los paquetes necesarios listados en la sección de requisitos.
2. Cargar el archivo `FINAL.r` en RStudio o cualquier IDE compatible con R.
3. Ejecutar el script, que leerá las secuencias del archivo `sequencias.fasta`, realizará el análisis y generará los resultados.
4. El archivo `EVIDENCIA_FINAL.Rmd` puede ser ejecutado para generar un informe reproducible que detalla el proceso y los resultados.

## Resultados Esperados

El análisis determinará la relación entre las diferentes variantes del COVID-19 basadas en sus secuencias genéticas. Los resultados incluirán:

- Un árbol filogenético que muestra qué tan relacionadas están las variantes.
- Gráficos que visualizan la similitud genética.
- Métricas estadísticas que cuantifican las diferencias entre las variantes.
  
---
