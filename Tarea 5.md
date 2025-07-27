## Tarea 5
### Agregando datos falsos de manera automatica

Para esta tarea utilizamos [Mockaroo.com](https://mockaroo.com/)

Generamos tres tablas para hacer el trabajo interesante imaginandonos que somos una empresa de retail. Por lo que necesitamos tener registro de lo que vendemos, sus costos y donde se vende.

**Transacción En SQL**
| Field Name | Type      |
|------------|-----------|
| ticket_ID  | Row Number|
| Store_ID   | Number    |
| Transaction_Date | Datetime  |
| Cashier    | Name      |

**Ticket En CSV**
| Field Name | Type      |
|------------|-----------|
| ID         | Row Number|
| Ticket_ID  | Number    |
| Product_ID | Number    |

**Producto En CSV**
| Field Name | Type      |
|------------|-----------|
| ticket_ID  | Row Number|
| Product_name   | Product Name    |
| Product Departament | Product Departament  |
| Product Price    | Price      |

Con estas tablas generamos 300 transacciones, las cuales en total movieron 1,000 productos y una tabla de 100 productos. De esta manera podemos saber de cuanto fue el tique, que es lo que más se vende, quien y que tienda vende más y toda la insght que se necesita.

**Hallazgos**
- Es muy versatil permitiendo descargar archivos CSV, XML, SQL, Excel, entre otros.
- En la version gratis no deja generar más de 1000 filas de informacion.
- Deja ensuciar datos permitiendote poner NULL y decidiendo que porcentaje del archivo quieres que este así.

**Dificultades**
- Me meti en el probelma de tener que estructurar bien la base desde un principio definiendo un limite de transacciones y productos, pues tenia que coincidir este limite en la columna number para poder lograr que los ids coincidieran.

**Recomendaciones o recursos relevantes**
- Si la información es correcta y esta en buen estado bajala en sql y no batalles, si crees que vas a tener tema mejor bajarlas en CSV y haz los ajustes primero
