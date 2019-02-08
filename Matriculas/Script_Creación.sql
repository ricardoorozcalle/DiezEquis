-- Eliminación de Tablas Existentes
drop TABLE TBL_Matricula go
drop TABLE TBL_AsignacionDocente go
drop TABLE TBL_Curso go
drop TABLE TBL_Docente go
drop TABLE TBL_Estudiante go


--Creación de Nuevas Tablas
CREATE TABLE TBL_Estudiante 
    (
     EST_Identificador VARCHAR (10) NOT NULL , 
     EST_Nombre VARCHAR (20) NOT NULL , 
     EST_Apellidos VARCHAR (30) NOT NULL
    )
    ON "default"
GO

CREATE TABLE TBL_Docente 
    (
     DOC_Identificador VARCHAR (10) NOT NULL , 
     DOC_Nombre VARCHAR (20) NOT NULL , 
     DOC_Apellidos VARCHAR (30) NOT NULL
    )
    ON "default"
GO

CREATE TABLE TBL_Curso 
    (
     CUR_Identificador VARCHAR (6) NOT NULL , 
     CUR_Nombre VARCHAR (40) NOT NULL 
    )
    ON "default"
GO

CREATE TABLE TBL_AsignacionDocente 
    (
     ASIG_DOC_Consecutivo INTEGER NOT NULL , 
     TBL_Curso_CUR_Identificador VARCHAR (6) NOT NULL , 
     TBL_Docente_DOC_Identificador VARCHAR (10) NOT NULL 
    )
    ON "default"
GO

CREATE TABLE TBL_Matricula 
    (
     MAT_Consecutivo INTEGER NOT NULL, 
     TBL_Estudiante_EST_Identificador VARCHAR (10) NOT NULL , 
     TBL_AsignacionDocente_ASIG_DOC_Consecutivo INTEGER NOT NULL ,
     MAT_Nota FLOAT (3) NOT NULL
    )
    ON "default"
GO


-- Creación de Primary Keys
ALTER TABLE TBL_Estudiante ADD CONSTRAINT TBL_Estudiante_PK PRIMARY KEY CLUSTERED (EST_Identificador)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
     ON "default" 
    GO

ALTER TABLE TBL_Docente ADD CONSTRAINT TBL_Docente_PK PRIMARY KEY CLUSTERED (DOC_Identificador)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
     ON "default" 
GO

ALTER TABLE TBL_Curso ADD CONSTRAINT TBL_Curso_PK PRIMARY KEY CLUSTERED (CUR_Identificador)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
     ON "default" 
GO

ALTER TABLE TBL_AsignacionDocente ADD CONSTRAINT TBL_AsignacionDocente_PK PRIMARY KEY CLUSTERED (ASIG_DOC_Consecutivo)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
     ON "default" 
    GO

ALTER TABLE TBL_Matricula ADD CONSTRAINT TBL_Matricula_PK PRIMARY KEY CLUSTERED (MAT_Consecutivo)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
     ON "default" 
GO

--Creación de Foreign Keys
ALTER TABLE TBL_AsignacionDocente 
    ADD CONSTRAINT TBL_AsignacionDocente_TBL_Curso_FK FOREIGN KEY 
    ( 
     TBL_Curso_CUR_Identificador
    ) 
    REFERENCES TBL_Curso 
    ( 
     CUR_Identificador 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE TBL_AsignacionDocente 
    ADD CONSTRAINT TBL_AsignacionDocente_TBL_Docente_FK FOREIGN KEY 
    ( 
     TBL_Docente_DOC_Identificador
    ) 
    REFERENCES TBL_Docente 
    ( 
     DOC_Identificador 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE TBL_Matricula 
    ADD CONSTRAINT TBL_Matricula_TBL_AsignacionDocente_FK FOREIGN KEY 
    ( 
     TBL_AsignacionDocente_ASIG_DOC_Consecutivo
    ) 
    REFERENCES TBL_AsignacionDocente 
    ( 
     ASIG_DOC_Consecutivo 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE TBL_Matricula 
    ADD CONSTRAINT TBL_Matricula_TBL_Estudiante_FK FOREIGN KEY 
    ( 
     TBL_Estudiante_EST_Identificador
    ) 
    REFERENCES TBL_Estudiante 
    ( 
     EST_Identificador 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

