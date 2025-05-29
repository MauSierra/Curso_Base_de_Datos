# Tarea 1 
### 1 - Describe una base de datos y sus relaciones de manera no estructurada (puede ser un párrafo, lista, esquema...) con la que trabajaras durante el tetramestre Agregar el tipo de Datos que supones tendrá cada uno de tus atributos.

Probablemente y como me gusta batallar usare la **ENIGH** *(Encuesta Nacional de Ingresos y Gastos de los Hogares)* . Es una encuesta muy completa con una base de datos muy robusta y compleja que usan muchos Economistas para analizar cambios en los patrones de consumo así como analizar efectos de políticas o cambios en el comportamiento sociodemografíco de las personas. 

Para este caso tenemos la fortuna de que la encuesta tiene su propio [Descriptor de Base de Datos](https://www.inegi.org.mx/contenidos/productos/prod_serv/contenidos/espanol/bvinegi/productos/nueva_estruc/889463910626.pdf) aqui voy a poder encontrar toda la información relevante con respecto a la base, sus variables y sus relaciones entre tablas. Se que voy a poder encontrar información sociodemografico de los individuos como sexo, edad, estudios, estado civil etc. A su vez esta se va relacionar con información de que compran, donde podremos ver gasto, cantidades, precios, frecuencias. Asi como tambien contiene información de los ingresos del individuo e información de su trabajo. Suponque que tendre datos de todo tipo strings, bools, floats, integers en una de esas cordenadas por si quiero geolocalizar algo.

Adicionalmente comparto el esquema de la base de datos para que puedan darse una idea de que contiene.
![Esquema]((https://github.com/MauSierra/Curso_Base_de_Datos/blob/main/Esquema%20BD%20ENIGH.png))

### 2 - Investigar diferentes SGBD, elegir algunos y describirlos. Citar Adecuadamente. Plagio invalida tarea.
En este caso decidi citar los 5 Gestores de Bases de Datos que e tenido la oportunidad de usar en mi vida laboral.

Empezare por definir que es un *Gestor de Base de Datos* en pocas palabras en un software que te permite almacenar y consultar la información de tus bases de datos de una manera más practica. En pocas palabras es una interfaz que gestiona tus bases de datos para que tu o tus sistemas las consulten. Tengo entendido que no solo difieren al momento de hablar de algunas funciones de codigo que algunas tienen y otras no. Si no que a su vez difieren entre como estan programadas y que métodos usan para acceder a la información de manera más rapida y eficiente pero bueno eso es tema aparte.

Respecto a los Gestores que conozco, podemos empezar con **Microsoft SQL Server** este es el gestor de bases de datos de la empresa de su mismo nombre. Es un gestor de bases de datos muy utilizado en el ambito profesional ya que viene integrado en el sistema de windows server. Se caracteriza principalmente por ser usado por empresas de tamaño medio que hostean sus aplicaciones en sus servidores físicos.

En segundo lugar tenemos a **MySQL**, este esta programado en PHP y lo más importante es de código abierto. En mi experiencia personal se que es muy usado pues es la base de datos por default de páginas web. En especial aqullas que corren bajo sistemas WordPress. Es una base de datos muy utilizada para todas las aplicaciones y soluciones web. Aunque parece ser que su opción esta poco a poco disminuyendo puesto que Oracle la compro recientemente.

En tercer lugar tenemos a **PostgreSql** este software se a popularizado mucho ultimamente por que al igual que MySql este es de código abierto. En mi experiencia personal e visto PostgreSql ser utilizada para el diseño de aplicaciones locales y web. A su vez e visto este software ser utilizado para proyectos independeintes, pequeñas y medianas empresas, hasta llegar a gobiernos municipales.

En cuarto lugar tenemos un base NoSQL **MongoDB**. A diferencia de las demás *MongoDB* almacena la información en formato de tablas con filas y columnas, si no con un formato de documento y apartado. Es complicada de consultar ya que su lenguaje es *NoSQL* por lo que rompe con los paradigmas de lo que uno esta acostumbrado. Aunque ofrece en cambio una flexibilidad y velocidad bastante grande a diferencia de los sistemas *SQL* para cosas como alamacenar fotos.

Por último tenemos a **Oracle** este es un sistema que realmente solo e visto en proyectos muy tecnicos, es un sistema 100% empresarial con un enfoque muy profesional. Es pionera y de las primeras en el mercado. Es muy usado en empresas y gobiernos por su reputación y antigüedad.

Como Refrerencia use: Diarlu. (2025). **21 Gestores de Bases de Datos más Usados 2025**. Recuperado el 28 de mayo de 2025, de [Diarlu](https://www.diarlu.com/gestores-bases-datos/).
