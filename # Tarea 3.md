# Tarea 3
-> Crear un esquema del modelo relacional de la base de datos a partir del modelo e-r de la tarea anterior.
Supongo que es este solo lo hice para una de la tablas:
![Tabla](image-url)


-> Representar con un diagrama relacional tu esquema del punto anterior.

## Tabla: Hogares

| Variable | Tipo | Key |
|----------|-----|------------|
| Foliovivienda | INT |Foranea (No incluida en mi ejercicio) |
|Foliohogar | INT | ID |
|huespedes | INT | |
|huesp_come | INT | |
|num_trab_d | INT | |
|trab_come  | INT | |
|acc_alim1 | BINARY | |

## Tabla: Gasto Hogar
| Variable | Tipo | Key |
|----------|-----|------------|
| Foliovivienda | INT |Foranea (No incluida en mi ejercicio) |
| Foliohogar | INT| Foranea - Tabla Hogares |
| Clave | INT | ID |
| gasto | FLOAT | |
| pago_mp | FLOAT | |
|costo | FLOAT | | 
|inmujer| FLOAT | |

## Tabla: Población
| Variable | Tipo | Key |
|----------|-----|------------|
| Foliovivienda | INT |Foranea (No incluida en mi ejercicio) |
| Foliohogar | INT| Foranea - Tabla Hogares |
| Numren | INT | ID |
| parentesco | INT | |
| sexo | BINARY | |
| edad | INT | |

## Tabla: Trabajos
| Variable | Tipo | Key |
|----------|-----|------------|
| Foliovivienda | INT |Foranea (No incluida en mi ejercicio) |
| Foliohogar | INT| Foranea - Tabla Hogares |
| Numren | INT | Foranea - Tabla Población |
| Id_Trabajo | INT | Clave que se interpreta con Pdf |
| trapais | BINARY | |
| subor | BINARY | |
| indep | BINARY | |
| contrato | BINARY | |

## Tabla: Ingresos
| Variable | Tipo | Key |
|----------|-----|------------|
| Foliovivienda | INT |Foranea (No incluida en mi ejercicio) |
| Foliohogar | INT| Foranea - Tabla Hogares |
| Numren | INT | Foranea - Tabla Población |
| Clave | INT | ID |
| mes_1 | INT | |
| mes_2 | INT | |
| ing_1 | INT | |
| ing_2 | INT | |

-> Encontrar cuatro operaciones que se vaya a usar en la base de datos y expresarlas mediante operadores del álgebra relacional. Explica con nuestras propias palabras cada una de estas operaciones.

### Seleccion
Población[sexo,edad]
Obtenemos del grupo Población solo la información de Sexo y Edad

### Resta
Ingresos[ing_1!=0]-Ingresos[ing_2=0]
Asi obtengo solo las personas que hayan obtenido ingresos en el mes 1 y en el mes 2

### Union
Trabajos[Numren] U Ingresos[Numren]
Asi obtengo los registros de los trabajos con sus rescpectivos ingresos, para poder hacer analisis.

### Intersección
Población[Numren] ∩ Ingresos[Numren]
Asi obtenemos solo la población que tiene ingresos