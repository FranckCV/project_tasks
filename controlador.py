from datetime import datetime, date , timedelta 
import bd

# INSERT

def insert_tarea( nombre , descripcion , color , orden , tareaid ):
    sql = '''
        INSERT INTO tarea( nombre, descripcion, color, orden , tareaid ) VALUES
        (%s, %s, %s, %s , %s)
    '''
    bd.sql_execute(sql,( nombre , descripcion , color , orden , tareaid ))


def insert_tabla_tarea( tareaid , filaid , columnaid , orden ):
    sql = '''
        INSERT INTO tabla_tarea ( tareaid , filaid , columnaid , orden ) VALUES
        (%s, %s, %s, %s)
    '''
    bd.sql_execute(sql,( tareaid , filaid , columnaid , orden ))


def insert_fila( nombre, color, orden, tablaid):
    sql = '''
        INSERT INTO fila( nombre, color, orden, tablaid) VALUES
        ( %s , %s , %s , %s )
    '''
    bd.sql_execute(sql,( nombre, color, orden, tablaid))


def insert_columna( nombre, color, orden, tablaid):
    sql = '''
        INSERT INTO columna ( nombre, color, orden, tablaid) VALUES
        ( %s , %s , %s , %s )
    '''
    bd.sql_execute(sql,( nombre, color, orden, tablaid))


def insert_tabla( nombre, espacioid ):
    sql = '''
        INSERT INTO tabla ( nombre, espacioid) VALUES
        ( %s , %s )
    '''
    return bd.sql_execute_lastrowid(sql,( nombre, espacioid ))




# UPDATE

# def update_table_column_id(tabla,):
#     bd.bd_update(tabla)

def actualizar_valor_nota_id(valor,id):
    conexion = bd.obtener_conexion()
    sql = '''
        UPDATE nota SET valor = '''+str(valor)+''' WHERE id = '''+str(id)+'''
    '''
    with conexion.cursor() as cursor:
        cursor.execute(sql)
    conexion.commit()
    conexion.close()


def update_cursos_color( actual , nuevo ):
    conexion = bd.obtener_conexion()
    sql = '''
        UPDATE curso SET color = %s WHERE color = %s
    '''
    with conexion.cursor() as cursor:
        cursor.execute(sql,( nuevo , actual ))
    conexion.commit()
    conexion.close()


def update_tarea_tabla( nombre , color , id ):
    sql = '''
        UPDATE tarea SET 
        nombre = %s ,
        color = %s 
        WHERE id = %s
    '''
    bd.sql_execute(sql,( nombre , color , id ))







# DELETE




# SELECT

def get_progreso_ciclo():
    sql = '''
    SELECT 
        codigo, 
        f_inicio, 
        f_fin,
        DATEDIFF(NOW(), f_inicio) AS actual,
        DATEDIFF(f_fin, f_inicio) AS total,
        ROUND(100 * DATEDIFF(NOW(), f_inicio) / DATEDIFF(f_fin, f_inicio), 2) AS porcentaje
    FROM semestre
    WHERE activo = 1
    LIMIT 1

    '''
    return bd.sql_select_fetchone(sql)


def get_promedio_final(usuarioid):
    sql = '''
       SELECT 
            m.usuarioid,
            ROUND(SUM(n.valor * n.porcentaje) / SUM(n.porcentaje), 2) AS promedio_general
        FROM matricula m
        JOIN detalle_matricula dm ON dm.matriculaid = m.id
        JOIN grupo g ON g.id = dm.grupoid
        JOIN unidad u ON u.grupoid = g.id
        JOIN nota n ON n.unidadid = u.id
        WHERE m.usuarioid = %s
        AND g.semestrecodigo = (SELECT codigo FROM semestre WHERE activo = 1 LIMIT 1)
        AND n.valor IS NOT NULL
        GROUP BY m.usuarioid
        '''
    data = bd.sql_select_fetchone(sql,(usuarioid))
    return data


def get_promedio_curso(usuarioid):
    sql = '''
        SELECT 
            c.* , 
            ROUND(SUM(n.valor * n.porcentaje) / SUM(n.porcentaje), 2) AS promedio
        FROM matricula m
        JOIN detalle_matricula dm ON dm.matriculaid = m.id
        JOIN grupo g ON g.id = dm.grupoid
        JOIN curso c ON c.id = g.cursoid
        JOIN unidad u ON u.grupoid = g.id
        JOIN nota n ON n.unidadid = u.id
        WHERE m.usuarioid = %s
        AND g.semestrecodigo = (SELECT codigo FROM semestre WHERE activo = 1 LIMIT 1)
        AND n.valor IS NOT NULL
        GROUP BY c.id, c.nombre
    '''
    data = bd.sql_select_fetchall(sql,(usuarioid))
    return data


def get_cursos():
    sql = '''
    select
        cu.id ,
        cu.nombre ,
        cu.siglas ,
        cu.descripcion ,
        cu.creditos ,
        cu.ciclo ,
        cu.icono ,
        cu.color
    from curso cu
    '''
    return bd.sql_select_fetchall(sql)


def get_ciclos():
    sql = '''
    SELECT DISTINCT ciclo FROM curso 
    where ciclo > 0 
    ORDER BY 1 ASC
    '''
    return bd.sql_select_fetchall(sql)



def obtener_info_notas():
    sql = '''
    select
        * 
    from curso cu
    left join unidad ud on ud.cursoid = cu.id
    left join nota nta on nta.unidadid = ud.id
    '''
    return bd.sql_select_fetchall(sql)


def obtener_cursos( matriculaid ):
    conexion = bd.obtener_conexion()
    with conexion.cursor() as cursor:
        sql = f'''
            select
                cu.id ,
                cu.nombre ,
                cu.siglas ,
                cu.creditos ,
                cu.ciclo , 
                gr.nombre as g_nombre ,
                count(DISTINCT ud.id) as cant_ud,
                ROUND(SUM(ud.porcentaje * (nta.porcentaje * nta.valor) / 10000) , 4) as prom,
                cu.color
            from curso cu
            left join grupo gr on gr.cursoid = cu.id
            left join unidad ud on ud.grupoid = gr.id
            left join nota nta on nta.unidadid = ud.id
            left join detalle_matricula det on det.grupoid = gr.id 
            where det.matriculaid = %s 
            GROUP BY cu.id
            order by  2
        '''
        cursor.execute(sql,( matriculaid ))
        elementos = cursor.fetchall() 
    conexion.close()
    return elementos


def obtener_unidades():
    conexion = bd.obtener_conexion()
    with conexion.cursor() as cursor:
        sql = '''
            select
                ud.id ,
                ud.nombre ,
                ud.porcentaje ,
                gr.cursoid as curso,
                ROUND(SUM(nta.porcentaje / 100 * nta.valor) , 2) as prom,
                count(nta.id)
            from unidad ud
            left join grupo gr on gr.id = ud.grupoid
            left join nota nta on nta.unidadid = ud.id
            GROUP BY ud.id 
        '''
        cursor.execute(sql)
        elementos = cursor.fetchall() 
    conexion.close()
    return elementos


def obtener_notas():
    conexion = bd.obtener_conexion()
    with conexion.cursor() as cursor:
        sql = '''
            select
                nta.id ,
                nta.nombre ,
                nta.porcentaje ,
                nta.valor ,
                nta.unidadid as unidad,
                nta.id 
            from nota nta
        '''
        cursor.execute(sql)
        elementos = cursor.fetchall() 
    conexion.close()
    return elementos






def get_tabla_info(id):
    sql = '''
    select
        tab.id ,
        tab.nombre ,
        tab.espacioid
    from tabla tab
    where tab.id = %s
    '''
    return bd.sql_select_fetchone(sql,(id))


def get_columnas_tablaid(tablaid):
    sql = '''
    SELECT 
    col.id, col.nombre, col.color, col.orden, col.tablaid 
    FROM columna col
    where col.tablaid = %s
    order by 4
    '''
    return bd.sql_select_fetchall(sql,(tablaid))


def get_filas_tablaid(tablaid):
    sql = '''
    SELECT 
    fil.id, fil.nombre, fil.color, fil.orden, fil.tablaid 
    FROM fila fil
    where fil.tablaid = %s
    order by 4
    '''
    return bd.sql_select_fetchall(sql,(tablaid))


def get_tareas_tablaid(tablaid):
    sql = '''
    SELECT 
        tar.id, tar.nombre, tar.descripcion, tar.color, tar.tareaid  , tbt.columnaid , tbt.filaid
    FROM tarea tar
    left join tabla_tarea tbt on tbt.tareaid = tar.id
    left join columna col on col.id = tbt.columnaid
    where col.tablaid = %s
    '''
    return bd.sql_select_fetchall(sql,(tablaid))


def get_tables():
    sql = '''
        SELECT
        t.id ,
        t.nombre ,
        (SELECT COUNT(*) FROM columna c WHERE c.tablaid = t.id) AS columnas,
        (SELECT COUNT(*) FROM fila f WHERE f.tablaid = t.id) AS filas,
        (SELECT COUNT(*) 
            FROM tabla_tarea tt
            JOIN fila f ON tt.filaid = f.id
            WHERE f.tablaid = t.id
        ) AS tareas
        FROM tabla t
        ORDER BY t.id
        '''
    data = bd.sql_select_fetchall(sql)
    return data


def get_orden_tarea(tareaid=None):
    where = f"WHERE tareaid = {tareaid}" if tareaid is not None else "WHERE tareaid IS NULL"

    sql = f'''
    select max(orden) as max from tarea 
    {where}
    '''
    return bd.sql_select_fetchone(sql)


def get_tareas(tareaid=None):
    where = f"WHERE tareaid = {tareaid}" if tareaid is not None else "WHERE tareaid IS NULL"

    sql = f'''
    WITH RECURSIVE tareas_recursivas AS (
        SELECT id, nombre, descripcion, color, orden , tareaid
        FROM tarea
        {where}
        UNION ALL
        SELECT t.id, t.nombre, t.descripcion, t.color, t.orden , t.tareaid
        FROM tarea t
        JOIN tareas_recursivas tr ON t.tareaid = tr.id
    )
    SELECT 
        tr.id, tr.nombre, tr.descripcion, tr.color, tr.orden , tr.tareaid,
        (SELECT COUNT(*) FROM tarea h WHERE h.tareaid = tr.id) as cant
    FROM tareas_recursivas tr
    ORDER BY 7 , 5, 6 , 2
    '''
    return bd.sql_select_fetchall(sql)



def get_tarea_id(id):
    sql = '''
    SELECT 
        tar.id, tar.nombre, tar.descripcion, tar.color, tar.tareaid  
    FROM tarea tar
    where tar.id = %s
    '''
    return bd.sql_select_fetchone(sql,(id))



# OTROS


















# def obtener_max_minuto_acts():
#     conexion = obtener_conexion()
#     with conexion.cursor() as cursor:
#         sql = '''
#             SELECT MAX(hor.min_ini) , MAX(hor.min_fin) FROM horario hor;
#         '''
#         cursor.execute(sql)
#         elementos = cursor.fetchone() 
#     conexion.close()

#     if elementos[0] < elementos[1]:
#         return elementos[1]
#     else:
#         return elementos[0]


# def obtener_acts():
#     conexion = obtener_conexion()
#     with conexion.cursor() as cursor:
#         sql = '''
#             select 
#                 ctx.id ,

#                 ctx.nombre ,
#                 ctx.descripcion ,
#                 hor.dia ,
                
#                 hor.h_ini ,
#                 hor.min_ini ,
#                 hor.h_fin ,
#                 hor.min_fin ,

#                 hor.fecha_ini ,
#                 hor.fecha_fin ,
#                 ctx.id ,
#                 ctx.color ,

#                 hor.h_fin * 60 + hor.min_fin - (hor.h_ini + 1) * 60 + 60 - hor.min_ini ,

#                 ctx.id 
#             from horario hor 
#             inner join contexto ctx on ctx.id = hor.contextoid
#         '''
#         cursor.execute(sql)
#         elementos = cursor.fetchall() 
#     conexion.close()
#     return elementos


# def obtener_horarios_fecha():
#     conexion = obtener_conexion()

#     # fechamod = fecha
#     # print(fechamod)

#     with conexion.cursor() as cursor:
#         sql = f'''
#             select 
#                 ctx.id ,

#                 ctx.nombre ,
#                 ctx.color ,
#                 hor.dia ,
                
#                 hor.h_ini ,
#                 hor.min_ini ,
#                 hor.h_fin ,
#                 hor.min_fin ,

#                 hor.fecha_ini ,
#                 hor.fecha_fin ,
#                 ctx.id ,
#                 ctx.descripcion ,

#                 hor.h_fin * 60 + hor.min_fin - (hor.h_ini + 1) * 60 + 60 - hor.min_ini ,

#                 ctx.id 
#             from horario hor 
#             inner join contexto ctx on ctx.id = hor.contextoid
#             where hor.fecha_ini <= CURRENT_DATE and CURRENT_DATE <= hor.fecha_fin
#         '''
#         # print(sql)
#         cursor.execute(sql)
#         elementos = cursor.fetchall() 
#     conexion.close()
#     return elementos


# def obtener_tareas_fecha():
#     conexion = obtener_conexion()

#     with conexion.cursor() as cursor:
#         sql = f'''
#             select 
#                 ctx.id ,

#                 ctx.nombre ,
#                 ctx.color ,
#                 ctx.descripcion ,

#                 hor.dia ,
                
#                 hor.h_ini ,
#                 hor.min_ini ,
#                 hor.h_fin ,
#                 hor.min_fin ,

#                 hor.fecha_ini ,
#                 hor.fecha_fin ,

#                 hor.titulo ,
#                 hor.descripcion ,

#                 ctx.letras ,
#                 ctx.icono ,
#                 ctx.img ,

#                 hor.id 
#             from contexto ctx 
#             left join horario hor on ctx.id = hor.contextoid
#             where hor.fecha_ini <= CURRENT_DATE and CURRENT_DATE <= hor.fecha_fin 
#             order by
#                 CASE 
#                     WHEN hor.dia >= (DAYOFWEEK(CURRENT_DATE) + 1) THEN 0 
#                     ELSE 1  
#                 END,
#                 hor.dia, 
#                 hor.h_ini, 
#                 hor.min_ini, 
#                 hor.h_fin;

#         '''
#         # print(sql)
#         cursor.execute(sql)
#         elementos = cursor.fetchall() 
#     conexion.close()
#     return elementos


# strSQL_tareas = f'''
#     select 
#         ctx.id ,

#         ctx.nombre ,
#         ctx.color ,
#         ctx.descripcion ,

#         hor.dia ,
        
#         hor.h_ini ,
#         hor.min_ini ,
#         hor.h_fin ,
#         hor.min_fin ,

#         hor.fecha_ini ,
#         hor.fecha_fin ,

#         hor.titulo ,
#         hor.descripcion ,

#         ctx.letras ,
#         ctx.icono ,
#         ctx.img ,

#         hor.id 
#     from horario hor 
#     left join contexto ctx on ctx.id = hor.contextoid
# '''


# def obtener_tareas_maniana():
#     conexion = obtener_conexion()

#     # fechamod = fecha.strftime("%Y-%m-%d")
#     # dia = fecha.weekday() + 1
#     # hora = fecha.hour  

#     with conexion.cursor() as cursor:
#         sql = strSQL_tareas + f'''
#             where hor.fecha_ini <= CURRENT_DATE
#             and CURRENT_DATE <= hor.fecha_fin 
#             and  hor.dia = (DAYOFWEEK(CURRENT_DATE) ) % 7

#             order by hor.h_ini , hor.min_ini , hor.h_fin
#         '''
#         # or ( hor.dia = (DAYOFWEEK(CURRENT_DATE) )
#         # print(sql)
#         cursor.execute(sql)
#         elementos = cursor.fetchall() 
#     conexion.close()
#     return elementos


# def obtener_tareas_hoy():
#     conexion = obtener_conexion()

#     # fechamod = fecha.strftime("%Y-%m-%d")
#     # dia = fecha.weekday() + 1
#     # hora = fecha.hour  

#     with conexion.cursor() as cursor:
#         sql = strSQL_tareas + f'''
#             where hor.fecha_ini <= CURRENT_DATE
#             and CURRENT_DATE <= hor.fecha_fin 
#             and  hor.dia = (DAYOFWEEK(CURRENT_DATE) - 1 ) % 7
#             and (HOUR(CURRENT_TIME)) < hor.h_fin 

#             order by hor.h_ini , hor.min_ini , hor.h_fin
#         '''
#         # or ( hor.dia = (DAYOFWEEK(CURRENT_DATE) )
#         # print(sql)
#         cursor.execute(sql)
#         elementos = cursor.fetchall() 
#     conexion.close()
#     return elementos


# def obtener_tareas_sinfecha():
#     conexion = obtener_conexion()

#     with conexion.cursor() as cursor:
#         sql = strSQL_tareas + f'''
#             where hor.fecha_ini is NULL 
#             and hor.fecha_fin is NULL
#             and hor.dia is NULL

#         '''
#         # print(sql)
#         cursor.execute(sql)
#         elementos = cursor.fetchall() 
#     conexion.close()
#     return elementos


# def obtener_tareas_hoy_test(fecha):
#     conexion = obtener_conexion()

#     fechamod = fecha.strftime("%Y-%m-%d")
#     dia = fecha.weekday() + 1
#     hora = fecha.hour  

#     with conexion.cursor() as cursor:
#         sql = f'''
#             select 
#                 ctx.id ,

#                 ctx.nombre ,
#                 ctx.color ,
#                 ctx.descripcion ,

#                 hor.dia ,
                
#                 hor.h_ini ,
#                 hor.min_ini ,
#                 hor.h_fin ,
#                 hor.min_fin ,

#                 hor.fecha_ini ,
#                 hor.fecha_fin ,

#                 hor.titulo ,
#                 hor.descripcion ,

#                 ctx.letras ,
#                 ctx.icono ,
#                 ctx.img ,

#                 hor.id 
#             from contexto ctx 
#             left join horario hor on ctx.id = hor.contextoid
#             where hor.fecha_ini <= '{fechamod}' and '{fechamod}' <= hor.fecha_fin 
#             and hor.dia = {dia} and {hora} <= hor.h_ini 
#             order by hor.fecha_ini desc , hor.dia , hor.h_ini , hor.min_ini , hor.h_fin
#         '''
#         # print(sql)
#         cursor.execute(sql)
#         elementos = cursor.fetchall() 
#     conexion.close()
#     return elementos



