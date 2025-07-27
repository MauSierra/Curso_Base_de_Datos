## Tarea 7 - Ajustes a la Base de Datos

Aunque comence el curso con una base de Gobierno durante el curso cambie de trabajo y ahora trabajo para HEB en el área de analisis de datos. Por ello quiero compartir algunas subconsultas que me han servido en estos días en este trabajo como ejemplo de como use el material de la clase.

El primer caso es de una base de datos donde tenemos ventas de un articulo por día en unidades y dinero. El problema es que me pidieron hacer un visualizador el cual pudiera comparar las ventas y unidades vendidas el día de hoy con el mismo día comparable del año pasado. La ventaja es que tenemos una tabla que ya tiene la relación de estas dos variables por lo que hice lo siguiente:

```sql
SELECT  
  t.FullDate,
  v.IdArticulo,
  SUM(v.VentasSinIVA) AS VentasActuales,
  SUM(v.Unidades) AS UnidadesActuales,
  SUM(s.VentasSinIVALY) AS VentasLY,
  SUM(s.UnidadesLY) AS UnidadesLY
FROM TH_Ventas v
LEFT JOIN TD_Time t ON v.DateFK = t.DateFK
LEFT JOIN (
    SELECT 
      DateFK,
      IdArticulo,
      SUM(VentasSinIVA) AS VentasSinIVALY, 
      SUM(Unidades) AS UnidadesLY
    FROM TH_Ventas
    GROUP BY DateFK, IdArticulo) s 
ON v.IdArticulo = s.IdArticulo AND t.DateFKLY = s.DateFK
GROUP BY t.FullDate, v.IdArticulo;
```

De esta manera pude usar un subquery para hacer un join y obtener las ventas y unidades de hoy, comparadas con las de ayer.

Tambien tengo una versión alterna del query para poder identificar cuando hubo crecimiento o no desde la base de datos.

```sql
SELECT  
  t.FullDate,
  v.IdArticulo,
  SUM(v.VentasSinIVA) AS VentasActuales,
  SUM(v.Unidades) AS UnidadesActuales,
  SUM(s.VentasSinIVALY) AS VentasLY,
  SUM(s.UnidadesLY) AS UnidadesLY
  CASE WHEN SUM(v.VentasSinIVA) > SUM(s.VentasSinIVALY) THEN CRECIO
       ELSE DECRECIO END AS Estado
FROM TH_Ventas v
LEFT JOIN TD_Time t ON v.DateFK = t.DateFK
LEFT JOIN (
    SELECT 
      DateFK,
      IdArticulo,
      SUM(VentasSinIVA) AS VentasSinIVALY, 
      SUM(Unidades) AS UnidadesLY
    FROM TH_Ventas
    GROUP BY DateFK, IdArticulo) s 
ON v.IdArticulo = s.IdArticulo AND t.DateFKLY = s.DateFK
GROUP BY t.FullDate, v.IdArticulo;
```

Con este puedo identificar y filtrar directamente si un articulo crecio o decrecio en ventas