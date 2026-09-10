USE AdidasSalesDB
SELECT TOP 10 *
FROM dbo.ventas_adidas;

---------------------------------
SELECT COUNT(*)	AS cantidad_registros
FROM dbo.ventas_adidas;

---------------------------------

SELECT TOP 10 
       fecha_factura,
       minorista,
       producto,
       region,
       ventas_totales
FROM dbo.ventas_adidas

---------------------------------

SELECT DISTINCT region
FROM dbo.ventas_adidas;

---------------------------------

SELECT DISTINCT producto
FROM dbo.ventas_adidas;

---------------------------------

SELECT TOP 20 *
FROM dbo.ventas_adidas
WHERE año = 2021; 

--------------------------------

SELECT TOP 10 
       fecha_factura,
       minorista,
       producto,
       ventas_totales
FROM dbo.ventas_adidas
ORDER BY ventas_totales DESC; 

USE AdidasSalesDB;
GO
-------------------------------
-- CONSULTA 01: KPIs GENERALES 
-------------------------------
SELECT 
   SUM (ventas_totales) AS ventas_totales,
   SUM (beneficio_operativo) AS beneficio_operativo,
   SUM (unidades_vendidas) AS unidades_vendidas,
   ROUND(
   (SUM(beneficio_operativo) / SUM(ventas_totales)) * 100,
   2
   ) AS margen_operativo_porcentaje
FROM dbo.ventas_adidas;

---------------------------------
-- CONSULTA 2: VENTAS POR REGION 
---------------------------------
SELECT
    region,
    SUM(ventas_totales) AS ventas_totales
FROM dbo.ventas_adidas
GROUP BY region 
ORDER BY ventas_totales DESC;

-----------------------------------------------
-- CONSULTA 3: VENTAS Y BENEFICIO POR PRODUCTO
-----------------------------------------------
SELECT 
    producto,
    SUM(ventas_totales) AS ventas_totales,
    SUM(beneficio_operativo) AS beneficio_operativo
FROM dbo.ventas_adidas
GROUP BY producto
ORDER BY ventas_totales DESC;

-------------------------------------
-- CONSULTA 4: VENTAS POR MINORISTA
-------------------------------------
SELECT
    minorista,
    SUM(ventas_totales) AS ventas_totales,
    SUM(beneficio_operativo) AS beneficio_operativo
FROM dbo.ventas_adidas
GROUP BY minorista
ORDER BY ventas_totales DESC;

-------------------------------------------
-- CONSULTA 5: VENTAS POR METODO DE VENTA
-------------------------------------------
SELECT
    metodo_de_venta,
    SUM(ventas_totales) AS ventas_totales,
    SUM(unidades_vendidas) AS unidades_vendidas,
    SUM(beneficio_operativo) AS beneficio_operativo
FROM dbo.ventas_adidas
GROUP BY metodo_de_venta
ORDER BY ventas_totales DESC;

-------------------------------------------
-- CONSULTA 6: VENTAS POR AÑO
-------------------------------------------
SELECT
     año,
     SUM(ventas_totales) AS ventas_totales,
     SUM(beneficio_operativo) AS beneficio_operativo
FROM dbo.ventas_adidas
GROUP BY año
ORDER BY año;

-------------------------------------------
-- CONSULTA 7:EVOLUCION MENSUAL
-------------------------------------------

SELECT 
    año,
    MONTH(fecha_factura) AS numero_mes,
    mes,
    SUM(ventas_totales) AS ventas_totales,
    SUM(beneficio_operativo) AS beneficio_operativo
FROM dbo.ventas_adidas
GROUP BY 
     año,
     MONTH(fecha_factura),
     mes
ORDER BY
     año,
     numero_mes;

------------------------------------------
-- CONSULTA 8: VENTAS POR TRIMESTRE
------------------------------------------
SELECT 
    año,
    trimestre,
    SUM(ventas_totales) AS ventas_totales,
    SUM(beneficio_operativo) AS beneficio_operativo
    FROM dbo.ventas_adidas
GROUP BY
    año,
    trimestre
ORDER BY
     año,
     trimestre;

-------------------------------------
-- CONSULTA 9: REGIONES CON VENTAS
-- SUPERIORES A 150 MILLONES
-------------------------------------
SELECT
    region,
    SUM(ventas_totales) AS ventas_totales
FROM dbo.ventas_adidas
GROUP BY region
HAVING SUM(ventas_totales)>150000000
ORDER BY ventas_totales DESC;

-----------------------------------------
-- CONSULTA 10: CLASIFICACION DE VENTAS
-----------------------------------------
SELECT
    producto,
    ventas_totales,
CASE 
    WHEN ventas_totales >= 5000 THEN 'Venta alta'
    WHEN ventas_totales >= 2000 THEN 'Venta media'
    ELSE 'Venta baja'
END AS categoria_venta
FROM dbo.ventas_adidas;

-----------------------------------
-- CONSULTA 11: CANTIDAD DE VENTAS
-- POR CATEGORÍA
-----------------------------------
SELECT
    CASE
        WHEN ventas_totales >= 5000 THEN 'Venta alta'
        WHEN ventas_totales >= 2000 THEN 'Venta media'
        ELSE 'Venta baja'
    END AS categoria_venta,
    COUNT(*) AS cantidad_operaciones
FROM dbo.ventas_adidas
GROUP BY
    CASE
        WHEN ventas_totales >= 5000 THEN 'Venta alta'
        WHEN ventas_totales >= 2000 THEN 'Venta media'
        ELSE 'Venta baja'
    END
ORDER BY cantidad_operaciones DESC;

-----------------------------------
-- CONSULTA 12: TOP 5 PRODUCTOS
-----------------------------------
SELECT TOP 5
    producto,
    SUM(ventas_totales) AS ventas_totales,
    SUM(beneficio_operativo) AS beneficio_operativo,
    SUM(unidades_vendidas) AS unidades_vendidas
FROM dbo.ventas_adidas
GROUP BY producto
ORDER BY ventas_totales DESC;

-----------------------------------
-- CONSULTA 13: RENTABILIDAD POR PRODUCTO
-----------------------------------
SELECT
    producto,
    SUM(ventas_totales) AS ventas_totales,
    SUM(beneficio_operativo) AS beneficio_operativo,
    ROUND(
        (SUM(beneficio_operativo) / SUM(ventas_totales)) * 100,
        2
    ) AS margen_operativo_porcentaje
FROM dbo.ventas_adidas
GROUP BY producto
ORDER BY margen_operativo_porcentaje DESC;

-----------------------------------
-- CONSULTA 14: PARTICIPACIÓN DE VENTAS
-- POR MINORISTA
-----------------------------------
SELECT
    minorista,
    SUM(ventas_totales) AS ventas_totales,
    ROUND(
        SUM(ventas_totales) * 100.0
        / SUM(SUM(ventas_totales)) OVER (),
        2
    ) AS participacion_porcentaje
FROM dbo.ventas_adidas
GROUP BY minorista
ORDER BY ventas_totales DESC;

-----------------------------------
-- CONSULTA 15: TOP CIUDADES MEDIANTE CTE
-----------------------------------
WITH ventas_por_ciudad AS (
    SELECT
        ciudad,
        region,
        SUM(ventas_totales) AS ventas_totales
    FROM dbo.ventas_adidas
    GROUP BY
        ciudad,
        region
)
SELECT TOP 10
    ciudad,
    region,
    ventas_totales
FROM ventas_por_ciudad
ORDER BY ventas_totales DESC;

-----------------------------------
-- CONSULTA 16: COMPARACIÓN ANUAL
-----------------------------------
SELECT
    año,
    SUM(ventas_totales) AS ventas_totales,
    SUM(beneficio_operativo) AS beneficio_operativo,
    SUM(unidades_vendidas) AS unidades_vendidas,
    ROUND(
        (SUM(beneficio_operativo) / SUM(ventas_totales)) * 100,
        2
    ) AS margen_operativo_porcentaje
FROM dbo.ventas_adidas
GROUP BY año
ORDER BY año;

-----------------------------------
-- CREACIÓN DE TABLA DIMENSIÓN REGIÓN
-----------------------------------
DROP TABLE IF EXISTS dbo.dim_region;
SELECT DISTINCT
    id_region,
    region
INTO dbo.dim_region
FROM dbo.ventas_adidas
WHERE id_region IS NOT NULL;

SELECT *
FROM dbo.dim_region;

-----------------------------------
-- CONSULTA 17: JOIN VENTAS + REGIÓN
-----------------------------------
SELECT
    r.region,
    SUM(v.ventas_totales) AS ventas_totales
FROM dbo.ventas_adidas AS v
INNER JOIN dbo.dim_region AS r
    ON v.id_region = r.id_region
GROUP BY r.region
ORDER BY ventas_totales DESC;
