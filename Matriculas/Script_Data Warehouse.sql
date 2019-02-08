-- Eliminacion de Tablas
DROP TABLE FACT_ASIGNATURA
DROP TABLE DIM_ESTUDIANTE
DROP TABLE DIM_CURSO


-- Creación de Dimensiones
CREATE TABLE DIM_CURSO 
    (
     CUR_Codigo VARCHAR (6) NOT NULL , 
     CUR_NombreCurso VARCHAR (40) NOT NULL 
    )
GO

CREATE TABLE DIM_ESTUDIANTE 
    (
     EST_Identificador VARCHAR (10) NOT NULL , 
     EST_Nombre VARCHAR (20) NOT NULL ,
     EST_Apellidos VARCHAR (30) NOT NULL
    )
GO

-- Creación de Tabla de Hecho
CREATE TABLE FACT_ASIGNATURA 
    (
     FACT_CodigoCurso VARCHAR (6) NOT NULL ,  
     FACT_IdentificadorEstudiante VARCHAR (10) NOT NULL ,
     FACT_NotaEstudiante FLOAT (3) NOT NULL
    )
GO


-- Creación de Primary Key
ALTER TABLE DIM_ESTUDIANTE ADD CONSTRAINT DIM_ESTUDIANTE_PK PRIMARY KEY CLUSTERED (EST_Identificador)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
     ON "default" 
    GO

    
ALTER TABLE DIM_CURSO ADD CONSTRAINT DIM_CURSO_PK PRIMARY KEY CLUSTERED (CUR_Codigo)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
     ON "default" 
    GO


--Creación de Foreign Keys
ALTER TABLE FACT_ASIGNATURA 
    ADD CONSTRAINT FACT_ASIGNATURA_DIM_CURSO_FK FOREIGN KEY 
    ( 
     FACT_CodigoCurso
    ) 
    REFERENCES DIM_CURSO 
    ( 
     CUR_Codigo 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO


ALTER TABLE FACT_ASIGNATURA 
    ADD CONSTRAINT FACT_ASIGNATURA_DIM_ESTUDIANTE_FK FOREIGN KEY 
    ( 
     FACT_IdentificadorEstudiante
    ) 
    REFERENCES DIM_ESTUDIANTE 
    ( 
     EST_Identificador 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO