CREATE PROCEDURE PS_CursosXEstudiante
AS
BEGIN
SELECT 
  t1.TBL_Estudiante_EST_Identificador AS 'Código Estudiante', (t2.EST_Nombre + ' ' + t2.EST_Apellidos) AS 'Nombre Estudiante',
  STUFF(
        (
            SELECT CONCAT(',' , t3.TBL_Curso_CUR_Identificador, '-', t4.CUR_Nombre)
                FROM TBL_Matricula AS t2
                INNER JOIN TBL_AsignacionDocente AS t3 ON t2.TBL_AsignacionDocente_ASIG_DOC_Consecutivo = t3.ASIG_DOC_Consecutivo 
                INNER JOIN TBL_Curso AS t4 ON t3.TBL_Curso_CUR_Identificador = t4.CUR_Identificador
                WHERE t2.TBL_Estudiante_EST_Identificador=t1.TBL_Estudiante_EST_Identificador                
                GROUP BY t2.TBL_AsignacionDocente_ASIG_DOC_Consecutivo, t3.TBL_Curso_CUR_Identificador, t4.CUR_Nombre
            FOR XML PATH('')
        ), 1, 1, '') AS 'Cursos Inscritos'
    FROM TBL_Matricula As t1
    INNER JOIN TBL_Estudiante AS t2 ON t2.EST_Identificador = t1.TBL_Estudiante_EST_Identificador
    GROUP BY t1.TBL_Estudiante_EST_Identificador, t2.EST_Nombre + ' ' + t2.EST_Apellidos
END