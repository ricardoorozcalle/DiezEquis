-- Creación de Trigger
CREATE TRIGGER TR_IU_TBL_Matricula
ON TBL_Matricula
INSTEAD OF INSERT, UPDATE
AS
DECLARE @nota FLOAT
SElECT @nota = (SELECT MAT_Nota FROM INSERTED)
if ((@nota <0.0) OR (@nota>5.0))
BEGIN
RAISERROR('¡La Nota Ingresada NO se Encuentra en el Rango PERMITIDO!', 10, 1)
ROLLBACK transaction;
END