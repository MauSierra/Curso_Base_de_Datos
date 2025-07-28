## Tare 8 - Vistas
Para este proyecto quiero mostrar otro ejemplo que estuvimos trbajando en la empresa. En este caso en especifico fue sobre un proyecto de Carniceria en el que se esta intentando medir la merma del producto.

Para este proyecto tenemos deiversas tablas las 3 de interes son:
**PD_Lotes**
|Varible|Descripción|
|-------|-----------|
|Id_Empleado|Empleado que lo trabajo|
|T_Lote|Tiempo que tardo en producir el Lote|
|PB_SKU|Clave Asignada a la Pieza|
|PT_Kg|Peso Inicial de la Pieza Base|
|H_Kg|Merma por Hueso de Pieza|
|S_KG|Merma por Sebo de Pieza|
|V_KG|Merma por Vicera de Pieza|
|ProT_KG|Peso Final del Producto Resultante|

**PD_Pieza**
|Varible|Descripción|
|-------|-----------|
|PB_SKU|Clave Asignada a la Pieza|
|Id_Provedor|Empleado que lo trabajo|
|Fecha_P|Fecha de Produccion de la Pieza Base|
|Fecha_AT|Fecha de Arrivo a Tienda|
|Fecha_C|Fecha de Caducidad|
|Id_Fuente|Matadero de Origen (Aunque no le dicen Matadero)|
|Id_Clasificacion| Tipo de Clasificación por Calidad de Carne |

**PD_Venta**
|Varible|Descripción|
|-------|-----------|
|PB_SKU|Clave Asignada a la Pieza|
|Fecha_E|Fecha que fue Etiquetada|
|Id_PF|ID de la Pieza Final en la que se transformo|
|Produccion_KG|Kg Producidos|

Cabe recalcar que aunque no son todos los campos son los campos relevantes para explicar lo que se hizo

```sql
CREATE VIEW Horizon_Carnes AS
SELECT  
  v.PB_SKU,
  v.Id_PF,
  v.Produccion_KG,
  p.Id_Provedor,
  p.Id_Fuente,
  p.Id_Clasificacion,
  l.T_Lote,
  l.Id_Empleado,
  l.PT_Kg,
  l.ProT_KG,
  (l.H_Kg + l.S_KG + l.V_KG) AS Merma,
  CASE 
    WHEN (l.H_Kg + l.S_KG + l.V_KG) + l.ProT_KG < l.PT_Kg THEN 'Buen Uso'
    WHEN l.ProT_KG IS NULL THEN 'No Usado'
    ELSE 'Mal Uso'
  END AS Estatus
FROM PD_Venta v
RIGHT JOIN Lotes l ON l.PB_SKU = v.PB_SKU
LEFT JOIN PD_Pieza p ON v.PB_SKU = p.PB_SKU;
```
Esta vista me permitiria trabajar más comodamente la información de power bi al consultar toda la producción en una sola tabla, ya que para poder vender la carne no es necesario que pase por el proceso de Merma, pero si nos ayudaria mucho el hecho de poder en una sola tabla consultar toda la producción y en esa misa observar la información especifica de los lotes que si han usado el sistema de merma.


Tambien con base en estos estatus nos interesa desarollar un trigger que detenga el mal uso de los lotes. En especifico nuestro tigger propuesto quiere evitar el mal uso del sistema en el que el operador al momento de pesar las diferentes categorias de Merma y el producto final, tiene más peso que la pieza base de origen. Esto no deberia ser posible por lo que nuestro trigger haria lo siguiente:
```sql
CREATE TRIGGER validar_uso_correcto
BEFORE INSERT ON Lotes
FOR EACH ROW
BEGIN
  IF (NEW.H_Kg + NEW.S_KG + NEW.V_KG + NEW.ProT_KG) > NEW.PT_Kg THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Error: La suma de Merma y Producción excede el peso total permitido';
  END IF;
END
```
