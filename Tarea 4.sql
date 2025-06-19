CREATE DATABASE MCD_BD;

# Se elimino Foliovivienda por que no voy a agregar esa taba en el modelo.
CREATE TABLE Hogares(
    Foliohogar INT PRIMARY KEY AUTO_INCREMENT,
    huespedes	INT,
    huesp_come	INT,
    num_trab_d	INT,
    trab_come	INT,
    acc_alim1	BOOLEAN
);

CREATE TABLE Gasto_Hogar (
    Foliohogar INT,
    Clave INT PRIMARY KEY AUTO_INCREMENT,
    gasto FLOAT,
    pago_mp FLOAT,
    costo FLOAT,
    inmujer FLOAT,
    FOREIGN KEY (Foliohogar) REFERENCES Hogares(Foliohogar)
);

CREATE TABLE Poblacion (
    Foliohogar INT,
    Numren INT PRIMARY KEY AUTO_INCREMENT,
    parentesco	INT,
    sexo BOOLEAN,	
    edad INT,	
    FOREIGN KEY (Foliohogar) REFERENCES Hogares(Foliohogar)
);

CREATE TABLE Trabajos(
    Foliohogar INT,
    Numren INT,
    Id_Trabajo INT,
    trapais	BOOLEAN,
    subor BOOLEAN,	
    indep BOOLEAN,	
    contrato BOOLEAN,
    FOREIGN KEY (Foliohogar) REFERENCES Hogares(Foliohogar),
    FOREIGN KEY (Numren) REFERENCES Poblacion(Numren)
);

CREATE TABLE Ingresos(
    Foliohogar INT,
    Numren INT,
    Clave INT PRIMARY KEY AUTO_INCREMENT,
    mes_1 INT,	
    mes_2 INT,	
    ing_1 INT,
    ing_2 INT,	
    FOREIGN KEY (Foliohogar) REFERENCES Hogares(Foliohogar),
    FOREIGN KEY (Numren) REFERENCES Poblacion(Numren)
);

INSERT INTO Hogares (huespedes, huesp_come, num_trab_d, trab_come, acc_alim1) VALUES
    (0, NULL, 0, NULL, 1),
    (1, 0, 0, NULL, 0),
    (0, NULL, 0, NULL, 0),
    (0, NULL, 0, NULL, 1),
    (0, NULL, 2, 1, 0);

#Limpiando los datos encontre muchas cosas que debo cambiar para que sean funcionales para la clase asi que más adelante modificare las tablas nuevamente.