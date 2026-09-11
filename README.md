# Proyecto 1_Analisis-Ventas-Adidas
Análisis integral de ventas de Adidas utilizando Excel, Power Query, SQL y Power BI para limpieza, análisis, KPIs y visualización de datos.

# 📊 Análisis de Ventas de Adidas

Proyecto de análisis de datos desarrollado a partir de una base de ventas de Adidas, con el objetivo de analizar el desempeño comercial de la empresa e identificar patrones relacionados con ventas, rentabilidad, productos, regiones, minoristas y métodos de venta.

El proyecto integra herramientas de **Excel, Power Query, SQL y Power BI**, aplicando un flujo completo de trabajo desde la limpieza y transformación de los datos hasta su análisis y visualización.

---

## 🎯 Objetivo del proyecto

Analizar el comportamiento de las ventas para responder preguntas como:

- ¿Cuál es el volumen total de ventas?
- ¿Qué productos generan mayores ingresos?
- ¿Qué regiones presentan mejor desempeño?
- ¿Qué minoristas concentran mayores ventas?
- ¿Qué método de venta tiene mejores resultados?
- ¿Cómo evolucionan las ventas a lo largo del tiempo?
- ¿Cuál es la rentabilidad del negocio?

---

## 🛠️ Herramientas utilizadas

- **Excel**
- **Power Query**
- **Tablas dinámicas**
- **SQL** 
- **Power BI** 

---

## 🗂️ Preparación y limpieza de datos

La preparación de los datos se realizó utilizando **Power Query**.

Entre las principales transformaciones se realizaron:

- eliminación de filas y columnas innecesarias;
- corrección de valores con errores;
- revisión y asignación de tipos de datos;
- traducción y normalización de campos al castellano;
- combinación de la tabla principal con tablas auxiliares;
- incorporación de nombres descriptivos a partir de IDs;
- creación de variables temporales:
  - Año
  - Mes
  - Número de mes
  - Trimestre
- control de valores vacíos y errores.

---

## 🔗 Combinación de tablas

La base original contenía diferentes variables identificadas mediante códigos.

A través de Power Query se realizaron combinaciones para obtener información descriptiva de:

- Minorista
- Región
- Estado
- Ciudad
- Familia
- Género
- Categoría
- Silueta
- Color principal
- Método de venta

Esto permitió construir una tabla final preparada para el análisis.

---

## 📈 Análisis realizado en Excel

Se utilizaron tablas dinámicas para analizar:

- ventas por año y mes;
- ventas por producto;
- ventas por región;
- ventas por minorista;
- ventas por método de venta;
- beneficio operativo por categoría.

---

## 📌 KPIs principales

| Indicador | Resultado |
|---|---:|
| Ventas totales | $899.902.125 |
| Beneficio operativo | $332.134.761,45 |
| Unidades vendidas | 2.478.861 |
| Margen operativo | 36,91 % |

---

## 📊 Dashboard en Excel

Se desarrolló un dashboard interactivo para visualizar los principales indicadores comerciales.

Incluye:

- KPIs generales;
- evolución de ventas;
- análisis por producto;
- análisis por región;
- análisis por minorista;
- análisis por método de venta;
- filtros y segmentadores para facilitar la exploración de los datos.

---

## 💡 Principales insights

A partir del análisis se identificaron algunos patrones relevantes:

- **Calzado deportivo para hombre** se encuentra entre los productos con mayor nivel de ventas.
- La región **Oeste** presenta un desempeño destacado.
- **Amazon** se encuentra entre los minoristas con mayor participación en ventas.
- Los diferentes métodos de venta presentan comportamientos distintos que pueden analizarse para evaluar el rendimiento de cada canal.

---

## 📁 Estructura del repositorio

```text
Proyecto_1_Analisis-Ventas-Adidas/
│
├── excel/
│   └── Analisis_Ventas_Adidas_Excel.xlsx
│
├── sql/
│   └── consultas_adidas.sql
│
├── power-bi/
│   └── Analisis_Ventas_Adidas.pbix
│
├── images/
│   └── dashboard_excel.png
│
└── README.md
