## Tarea 6 - Palabras Claves
Escogi diferentes casos en los caules poder aplicar lo que se nos pidio en la tarea, intentando poder usar al menos 1 vez cada tabla.

El primer caso fue cual es la tienda con **Más transacciones:**
```sql
SELECT Store_ID, COUNT(Store_ID) AS total
FROM Transacción
GROUP BY Store_ID
ORDER BY 2 DESC
LIMIT 1;
```

*Resultado:* 
|Store|Total|
|-----|-----|
|  9  | 37  |

Producto **Más Caro y Más Barato:**
```sql
SELECT Product_name, MAX(Product_Price) AS Caro
FROM Producto
GROUP BY Product_name
ORDER BY 2 DESC
LIMIT 1;

SELECT Product_name, MIN(Product_Price) AS Barato
FROM Producto
GROUP BY Product_name
ORDER BY 2 DESC
LIMIT 1;
```

*Resultado:* 
|Producto|Precio|
|-----|-----|
|  Portable USB-C Monitor  | 199.99  |
|  Avocados | 1.50  |

Producto **75 Percentil**
```sql
SELECT Product_name AS cuantil_75
FROM 
(
  SELECT 
    Product_name,
    PERCENT_RANK() OVER (ORDER BY Product_Price ) AS percentil
  FROM Producto
) as Subquery
WHERE percentil >= 0.75
ORDER BY percentil
LIMIT 1;
```

*Resultado:* 
|Producto|Precio|
|-----|-----|
|  Foldable Yoga Mat  | 29.99  |

Moda Cantidad de Productos por Ticket:
```sql
SELECT 
Total_P AS Cantidad, 
COUNT(*) AS frecuencia
(
  SELECT 
    Ticket_ID,
    Count(*) AS Total_P
  FROM Tickets
  GROUP BY Ticket_ID
) as Subquery
GROUP BY Total_P
ORDER BY frecuencia DESC
LIMIT 1;
```

*Resultado:* 
|Producto|Precio|
|-----|-----|
| 3 | 71  |

### Hallazgos, dificultades, implementacion de soluciones encontradas en línea.
**Hallazgos**
- Se que es una base aleatoria pero me sorprendio mucho que el producto más barato sea un aguacate.

**Dificultades**
- Es triste que SQL no tenga una funcion que te sque los cuartiles esta seria muy util.