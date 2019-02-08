-- Vista para la Base de Datos
CREATE VIEW VWS_DocentesXCurso
AS
SELECT t1.TBL_Curso_CUR_Identificador As 'Curso', t2.CUR_Nombre As 'Nombre Curso',
STUFF
(
    (
        SELECT CONCAT(', ' , t3.DOC_Nombre , ' ' , t3.DOC_Apellidos)
        FROM TBL_AsignacionDocente AS t2 
        INNER JOIN TBL_Docente AS t3 ON t2.TBL_Docente_DOC_Identificador = t3.DOC_Identificador
        WHERE t1.TBL_Curso_CUR_Identificador = t2.TBL_Curso_CUR_Identificador                 
        FOR XML PATH ('')
    ), 1, 1, ''
)  As 'Docentes'
FROM TBL_AsignacionDocente AS t1
INNER JOIN TBL_Curso As t2 ON t1.TBL_Curso_CUR_Identificador = t2.CUR_Identificador
GROUP BY TBL_Curso_CUR_Identificador, t2.CUR_Nombre