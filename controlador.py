from datetime import datetime, date , timedelta 
import bd
import utils

LISTA_GRUPOS = '( 21 , 16 , 26)'

# INSERT

def insert_tarea( nombre , descripcion , color , orden , tareaid ):
    sql = '''
        INSERT INTO tarea( nombre, descripcion, color, orden , tareaid ) VALUES
        (%s, %s, %s, %s , %s)
    '''
    return bd.sql_execute_lastrowid(sql,( nombre , descripcion , color , orden , tareaid ))


def insert_tabla_tarea( tareaid , filaid , columnaid , color , orden ):
    sql = '''
        INSERT INTO tabla_tarea ( tareaid , filaid , columnaid , color,  orden ) VALUES
        (%s, %s, %s,%s, %s)
    '''
    return bd.sql_execute_lastrowid(sql,( tareaid , filaid , columnaid , color,  orden ))


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


def insert_grupo( nombre, docenteid , semestrecodigo , cursoid ):
    sql = '''
        INSERT INTO grupo ( nombre, docenteid , semestrecodigo , cursoid ) VALUES
        ( %s , %s , %s , %s )
    '''
    return bd.sql_execute_lastrowid(sql,( nombre.upper(), docenteid , semestrecodigo , cursoid ))


def insert_horario_grupo( nombre, dia, h_ini, min_ini, h_fin, min_fin, grupoid):
    sql = '''
        INSERT INTO horario_grupo( nombre, dia, h_ini, min_ini, h_fin, min_fin, grupoid) VALUES
        ( %s, %s, %s, %s, %s, %s, %s )
    '''
    return bd.sql_execute_lastrowid(sql,( nombre, dia, h_ini, min_ini, h_fin, min_fin, grupoid))


def insert_docente( nombres, apellidos ):
    sql = '''
        INSERT INTO docente ( nombres , apellidos) VALUES
        ( %s , %s )
    '''
    return bd.sql_execute(sql,( nombres, apellidos ))


def insert_matricula(nombre, semestrecodigo, usuarioid):
    sql = '''
        INSERT INTO matricula(nombre, estado, seleccionado, semestrecodigo, usuarioid) VALUES 
        (%s, 0, 0, %s, %s)
    '''
    bd.sql_execute(sql,(nombre, semestrecodigo, usuarioid))


def insert_grupo_horarios( nombre, docenteid , semestrecodigo , cursoid , dia1 , h_ini1 , h_fin1 , dia2 = None, h_ini2  = None, h_fin2  = None):
    grupoid = insert_grupo(nombre, docenteid , semestrecodigo , cursoid)
    horarioid1 = insert_horario_grupo( None, dia1, h_ini1, 0, h_fin1, 0, grupoid)
    if dia2 and h_ini2 and h_fin2:
        horarioid2 = insert_horario_grupo( None, dia2, h_ini2, 0, h_fin2, 0, grupoid)


def insert_detalle_matricula(matriculaid, grupoid):
    sql = '''
        INSERT INTO detalle_matricula(matriculaid, grupoid) VALUES
        ( %s , %s )
    '''
    bd.sql_execute(sql,(matriculaid, grupoid))


def insert_paleta(color1, color2, color3, color4, color5, colorbg1, colorbg2, colorbg3, estado=0):
    sql = '''
        INSERT INTO paleta(color1, color2, color3, color4, color5, colorbg1, colorbg2, colorbg3, estado) VALUES
        (%s, %s, %s, %s, %s, %s, %s, %s, %s)
    '''
    return bd.sql_execute_lastrowid(sql,(color1, color2, color3, color4, color5, colorbg1, colorbg2, colorbg3, estado))


# def insert_actividad(nombre, siglas, descripcion, color, icono, fecha, tipo_actividadid, grupoid=None, contextoid=None):
#     sql = '''
#         INSERT INTO actividad(nombre, siglas, descripcion, color, icono, fecha, tipo_actividadid, grupoid, contextoid) VALUES 
#         (%s,%s,%s, %s,%s,%s, %s,%s,%s)
#     '''
#     bd.sql_execute(sql,(nombre, siglas, descripcion, color, icono, fecha, tipo_actividadid, grupoid, contextoid))

def insert_actividad(nombre, siglas, descripcion, color, icono, fecha, hora, tipo_actividadid, grupoid=None, contextoid=None):
    date = f'{fecha} {hora}:00'
    sql = '''
        INSERT INTO actividad(nombre, siglas, descripcion, color, icono, fecha, tipo_actividadid, grupoid, contextoid) VALUES 
        (%s,%s,%s, %s,%s,%s, %s,%s,%s)
    '''
    bd.sql_execute(sql,(nombre, siglas, descripcion, color, icono, date, tipo_actividadid, grupoid, contextoid))


def insert_unidad(nombre, porcentaje, grupoid):
    sql = '''
        INSERT INTO unidad(nombre, porcentaje, grupoid) VALUES 
        (%s,%s,%s)
    '''
    bd.sql_execute(sql,(nombre, porcentaje, grupoid))


def insert_nota(nombre, porcentaje, unidadid,usuarioid):
    sql1 = '''
        INSERT INTO nota(nombre, porcentaje, unidadid) VALUES 
        (%s,%s,%s)
    '''
    nid = bd.sql_execute_lastrowid(sql1,(nombre, porcentaje, unidadid))
    
    sql2 = '''
        INSERT INTO usuario_nota(usuarioid, notaid, valor) VALUES 
        (%s,%s,%s)
    '''
    bd.sql_execute(sql2,(usuarioid, nid, 0))



# UPDATE


def update_actividad(id,nombre, siglas, descripcion, color, icono, fecha, hora, tipo_actividadid, grupoid=None, contextoid=None):
    date = f'{fecha} {hora}:00'
    sql = '''
        UPDATE actividad SET 
        nombre =           %s,
        siglas =           %s,
        descripcion =      %s,
        color =            %s,
        icono =            %s,
        fecha =            %s,
        tipo_actividadid = %s,
        grupoid =          %s,
        contextoid =       %s
        where id = %s
    '''
    bd.sql_execute(sql,(nombre, siglas, descripcion, color, icono, date, tipo_actividadid, grupoid, contextoid, id))


def change_configuracion_ver_dias():
    sql = '''
        UPDATE configuracion SET 
        ver_dias = 1 - ver_dias
        WHERE activo = 1
    '''
    bd.sql_execute(sql)


def change_configuracion_modo_simple():
    sql = '''
        UPDATE configuracion SET 
        modo_simple = 1 - modo_simple
        WHERE activo = 1
    '''
    bd.sql_execute(sql)


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


def update_tabla_tarea_celda( orden , ncolumnaid , nfilaid , columnaid, filaid , tareaid ):
    sql = '''
        UPDATE tabla_tarea SET 
        orden = %s ,
        columnaid = %s ,
        filaid = %s
        WHERE columnaid = %s and filaid = %s and tareaid = %s
    '''
    bd.sql_execute(sql,( orden , ncolumnaid , nfilaid , columnaid, filaid , tareaid ))


def update_tarea_tabla_color( color , tareaid , columnaid , filaid ):
    sql = '''
        UPDATE tabla_tarea SET 
        color = %s
        WHERE tareaid = %s and columnaid = %s and filaid = %s
    '''
    bd.sql_execute(sql,( color , tareaid , columnaid , filaid ))


def update_tarea_tabla_orden( orden , tareaid , columnaid , filaid ):
    sql = '''
        UPDATE tabla_tarea SET 
        orden = %s
        WHERE tareaid = %s and columnaid = %s and filaid = %s
    '''
    bd.sql_execute(sql,( orden , tareaid , columnaid , filaid ))


def update_columna_orden( orden , id  ):
    sql = '''
        UPDATE columna SET 
        orden = %s
        WHERE id = %s
    '''
    bd.sql_execute(sql,( orden , id ))


def update_fila_orden( orden , id  ):
    sql = '''
        UPDATE fila SET 
        orden = %s
        WHERE id = %s
    '''
    bd.sql_execute(sql,( orden , id ))



# DELETE

def delete_detalle_matricula_matriculaid(matriculaid):
    sql = '''
    DELETE FROM detalle_matricula WHERE matriculaid = %s
    '''
    return bd.sql_execute(sql,(matriculaid))


def delete_columna(id):
    sql = '''
    DELETE FROM columna WHERE id = %s
    '''
    return bd.sql_execute(sql,(id))


def delete_fila(id):
    sql = '''
    DELETE FROM fila WHERE id = %s
    '''
    return bd.sql_execute(sql,(id))


def delete_paleta(id):
    sql = '''
    DELETE FROM paleta WHERE id = %s
    '''
    return bd.sql_execute(sql,(id))


# SELECT

def get_actividades_items(date_ini=None, date_fin=None):
    filtros = []
    params = []

    if date_ini:
        filtros.append(" act.fecha >= %s ")
        params.append(date_ini)
    if date_fin:
        filtros.append(" act.fecha <= %s ")
        params.append(date_fin)

    where = f" WHERE {' AND '.join(filtros)} " if filtros else ""

    sql = f'''
    SELECT 
        act.id, 
        act.nombre, 
        act.fecha,  
        CASE 
            WHEN gr.id IS NOT NULL THEN CONCAT(cur.nombre, ' - ', gr.nombre) 
            WHEN con.id IS NOT NULL THEN con.nombre
            ELSE act.nombre 
        END AS titulo,
        CASE 
            WHEN gr.id IS NOT NULL THEN cur.siglas 
            WHEN con.id IS NOT NULL THEN con.siglas
            ELSE act.siglas 
        END AS siglas,
        CASE 
            WHEN gr.id IS NOT NULL THEN cur.icono 
            WHEN con.id IS NOT NULL THEN con.icono
            ELSE act.icono 
        END AS icono,        
        CASE 
            WHEN gr.id IS NOT NULL THEN cur.color 
            WHEN con.id IS NOT NULL THEN con.color
            ELSE act.color 
        END AS color, 
        tip.nombre AS tipo,
        act.tipo_actividadid, 
        act.grupoid, 
        act.contextoid 
    FROM actividad act
    LEFT JOIN grupo gr ON act.grupoid = gr.id
    LEFT JOIN curso cur ON cur.id = gr.cursoid
    LEFT JOIN contexto con ON con.id = act.contextoid
    LEFT JOIN tipo_actividad tip ON tip.id = act.tipo_actividadid
    {where}
    ORDER BY act.fecha ASC
    '''

    data = bd.sql_select_fetchall(sql, params)
    return data


# def get_actividades_items():
#     sql = f'''
#     SELECT 
#         act.id, 
#         act.nombre, 
#         act.fecha,  
#         CASE 
#         	WHEN gr.id is not null THEN CONCAT(cur.nombre, ' - ', gr.nombre) 
#         	WHEN con.id is not null THEN con.nombre
#             ELSE act.nombre 
#         END as titulo,
#         CASE 
#         	WHEN gr.id is not null THEN cur.siglas 
#         	WHEN con.id is not null THEN con.siglas
#             ELSE act.siglas 
#         END as siglas,
#         CASE 
#         	WHEN gr.id is not null THEN cur.icono 
#         	WHEN con.id is not null THEN con.icono
#             ELSE act.icono 
#         END as icono,        
#         CASE 
#         	WHEN gr.id is not null THEN cur.color 
#         	WHEN con.id is not null THEN con.color
#             ELSE act.color 
#         END as color, 
#         tip.nombre as tipo,
#         act.tipo_actividadid, 
#         act.grupoid, 
#         act.contextoid 
#     FROM actividad act
#     left join grupo gr on act.grupoid = gr.id
#     left join curso cur on cur.id = gr.cursoid
#     left join contexto con on con.id = act.contextoid
#     left join tipo_actividad tip on tip.id = act.tipo_actividadid
#     order by 3 asc
#     '''
#     data = bd.sql_select_fetchall(sql )
#     return data


def get_bd_color( tabla , id ):
    sql = f'''
    SELECT color
    FROM {tabla} 
    WHERE id = %s
    '''
    data = bd.sql_select_fetchone(sql, (id) )
    color = data.get('color') if data else utils.COLOR_DEFAULT
    return color


def get_paleta():
    sql = f'''
    SELECT 
        id, 
        color1, color2, color3, color4, color5,
        colorbg1, colorbg2, colorbg3, 
        estado 
    FROM paleta
    '''
    data = bd.sql_select_fetchall(sql )
    return data


def get_paleta_actual():
    sql = f'''
    SELECT 
        id, 
        color1, color2, color3, color4, color5,
        colorbg1, colorbg2, colorbg3, 
        estado 
    FROM paleta
    where estado = 1
    limit 1
    '''
    data = bd.sql_select_fetchone(sql )
    return data


def consult_columna( id ):
    sql = '''
    SELECT id, nombre, color, orden, tablaid 
    FROM columna 
    WHERE id = %s
    '''
    return bd.sql_select_fetchone(sql, (id) )


def consult_fila( id ):
    sql = '''
    SELECT id, nombre, color, orden, tablaid 
    FROM fila 
    WHERE id = %s
    '''
    return bd.sql_select_fetchone(sql, (id) )


def consult_tabla_tarea(tareaid , columnaid , filaid):
    sql = '''
    SELECT 
        tareaid, filaid, columnaid, color, orden
    from tabla_tarea tab
    where tab.tareaid = %s and tab.columnaid = %s and tab.filaid = %s
    '''
    return bd.sql_select_fetchone(sql,(tareaid , columnaid , filaid))


def get_max_min_orden_bd(tabla , where , lista):
    wheretext = f' where {where}' if where else ''
    sql = f'''
    SELECT 
        IFNULL(MAX(tab.orden),1) as max ,
        IFNULL(MIN(tab.orden),0) as min 
    from {tabla} tab
    {wheretext}
    '''
    return bd.sql_select_fetchone(sql,lista)


def get_max_min_orden_element_tabla( e , tablaid ):
    if e == 'C':
        tabla = 'columna'
    elif e == 'F':
        tabla = 'fila'

    sql = f'''
    SELECT 
        IFNULL(MAX(tab.orden),1) as max ,
        IFNULL(MIN(tab.orden),0) as min 
    from {tabla} tab
    where tab.tablaid = %s 
    '''
    return bd.sql_select_fetchone(sql,( tablaid ))


def get_max_min_orden_tabla_tarea(columnaid , filaid):
    sql = '''
    SELECT 
        IFNULL(MAX(tab.orden),1) as max ,
        IFNULL(MIN(tab.orden),0) as min 
    from tabla_tarea tab
    where tab.columnaid = %s and tab.filaid = %s
    '''
    return bd.sql_select_fetchone(sql,(columnaid , filaid))


def get_cursos_grupos_matriculados():
    sql = '''
    SELECT DISTINCT
        cu.id, 
        cu.nombre, 
        cu.siglas, 
		cu.descripcion, 
        cu.creditos, 
        cu.ciclo, 
        cu.icono, 
        cu.color
    FROM grupo gr
    INNER JOIN detalle_matricula det on det.grupoid = gr.id
    inner join curso cu on cu.id = gr.cursoid
    ORDER BY cu.id ASC
    '''
    return bd.sql_select_fetchall(sql)


def get_ciclos_grupos_matriculados():
    sql = '''
    SELECT DISTINCT
        cu.ciclo , 
        gr.semestrecodigo
    FROM grupo gr
    INNER JOIN detalle_matricula det on det.grupoid = gr.id
    inner join curso cu on cu.id = gr.cursoid
    '''
    return bd.sql_select_fetchall(sql)


def get_grupos_matriculados():
    sql = '''
    SELECT 
        gr.id, 
        gr.nombre, 
        gr.docenteid, 
        gr.semestrecodigo, 
        gr.cursoid 
    FROM grupo gr
    INNER JOIN detalle_matricula det on det.grupoid = gr.id
    '''
    return bd.sql_select_fetchall(sql)


def consult_detalle_matricula_matriculaid_grupoid(matriculaid,grupoid):
    sql = '''
    SELECT matriculaid, grupoid 
    FROM detalle_matricula 
    WHERE matriculaid = %s and grupoid = %s
    '''
    return bd.sql_select_fetchone(sql,(matriculaid,grupoid))


def get_progreso_ciclo():
    sql = f'''
    SELECT 
        codigo, 
        f_inicio, 
        f_fin,
        DATEDIFF('{utils.local_datetime_bd()}', f_inicio) AS actual,
        DATEDIFF(f_fin, f_inicio) AS total,
        ROUND(100 * DATEDIFF('{utils.local_datetime_bd()}', f_inicio) / DATEDIFF(f_fin, f_inicio), 2) AS porcentaje
    FROM semestre
    WHERE activo = 1
    LIMIT 1
    '''
    # print(sql)
    return bd.sql_select_fetchone(sql)


def get_promedio_final(usuarioid):
    sql = '''
        SELECT 
            m.usuarioid,
            ROUND(SUM(un.valor * n.porcentaje) / SUM(n.porcentaje), 2) AS promedio_general
        FROM matricula m
        JOIN detalle_matricula dm ON dm.matriculaid = m.id
        JOIN grupo g ON g.id = dm.grupoid
        JOIN unidad u ON u.grupoid = g.id
        JOIN nota n ON n.unidadid = u.id
        join usuario_nota un on un.notaid = n.id and un.usuarioid = m.usuarioid
        WHERE m.usuarioid = %s
        AND g.semestrecodigo = (SELECT codigo FROM semestre WHERE activo = 1 LIMIT 1)
        AND un.valor IS NOT NULL
        GROUP BY m.usuarioid
        '''
    data = bd.sql_select_fetchone(sql,(usuarioid))
    return data


def get_promedio_curso(usuarioid):
    sql = '''
        SELECT 
            c.* , 
            ROUND(SUM(un.valor * n.porcentaje) / SUM(n.porcentaje), 2) AS promedio
        FROM matricula m
        JOIN detalle_matricula dm ON dm.matriculaid = m.id
        JOIN grupo g ON g.id = dm.grupoid
        JOIN curso c ON c.id = g.cursoid
        JOIN unidad u ON u.grupoid = g.id
        JOIN nota n ON n.unidadid = u.id
        join usuario_nota un on un.notaid = n.id and un.usuarioid = m.usuarioid
        WHERE m.usuarioid = %s
        AND g.semestrecodigo = (SELECT codigo FROM semestre WHERE activo = 1 LIMIT 1)
        AND un.valor IS NOT NULL
        GROUP BY c.id, c.nombre
    '''
    data = bd.sql_select_fetchall(sql,(usuarioid))
    return data


def get_cursos_grupo():
    sql = '''
    SELECT DISTINCT
    	cu.id ,
		cu.nombre ,
        cu.siglas  ,
        cu.color  ,
        cu.ciclo 
    FROM grupo gr
    inner join curso cu on cu.id = gr.cursoid
    inner join docente doc on doc.id = gr.docenteid
    order by 2 asc
    '''
    return bd.sql_select_fetchall(sql)


def get_cursos_grupo_semestre(semestre):
    sql = '''
    SELECT DISTINCT
    	cu.id ,
		cu.nombre ,
        cu.siglas  ,
        cu.color  ,
        cu.ciclo 
    FROM grupo gr
    inner join curso cu on cu.id = gr.cursoid
    inner join docente doc on doc.id = gr.docenteid
    where gr.semestrecodigo = %s
    order by 2 asc
    '''
    return bd.sql_select_fetchall(sql,(semestre))


def get_matriculas():
    sql = '''
    SELECT 
        id, 
        nombre, 
        estado, 
        seleccionado, 
        fecha, 
        semestrecodigo, 
        usuarioid 
    FROM matricula
    '''
    return bd.sql_select_fetchall(sql)


def consult_matricula_id(id):
    sql = '''
    SELECT 
        id, 
        nombre, 
        estado, 
        seleccionado, 
        fecha, 
        semestrecodigo, 
        usuarioid 
    FROM matricula
    where id = %s
    '''
    return bd.sql_select_fetchone(sql,(id))


def get_ciclos_grupos():
    sql = '''
    SELECT DISTINCT 
        gr.semestrecodigo ,
        cu.ciclo 
    FROM grupo gr
    inner join curso cu on cu.id = gr.cursoid
    inner join docente doc on doc.id = gr.docenteid
    order by 1 desc , 2 desc
    '''
    return bd.sql_select_fetchall(sql)


def get_ciclos_grupos_semestre(semestre):
    sql = '''
    SELECT DISTINCT 
        gr.semestrecodigo ,
        cu.ciclo 
    FROM grupo gr
    inner join curso cu on cu.id = gr.cursoid
    inner join docente doc on doc.id = gr.docenteid
    where gr.semestrecodigo = %s
    order by 1 desc , 2 desc
    '''
    return bd.sql_select_fetchall(sql,(semestre))


def get_horario_grupo():
    sql = '''
    SELECT 
        hor.id , 
        hor.dia , 
        hor.h_ini , 
        hor.h_fin, 
        hor.grupoid
    FROM horario_grupo hor     
    order by 2 asc , 3 asc
    '''
    return bd.sql_select_fetchall(sql)


def get_grupos_semestre_actual():
    sql = f'''
    SELECT 
		gr.semestrecodigo ,
		cu.nombre as cu_nombre,
        gr.nombre as gr_nombre ,
        cu.siglas as cu_siglas ,
        cu.color as color ,
        cu.ciclo as ciclo ,
        doc.apellidos ,
        doc.nombres ,
        gr.id ,
        gr.cursoid
    FROM grupo gr
    inner join curso cu on cu.id = gr.cursoid
    inner join docente doc on doc.id = gr.docenteid
    inner join semestre sem on sem.codigo = gr.semestrecodigo
    where sem.f_inicio <= {utils.local_datetime_bd()} and {utils.local_datetime_bd()} <= sem.f_fin
    order by 1 asc , 2 asc, 3 asc
    '''
    return bd.sql_select_fetchall(sql)


def get_grupos_semestre(semestre):
    sql = f'''
    SELECT 
		gr.semestrecodigo ,
		cu.nombre as cu_nombre,
        gr.nombre as gr_nombre ,
        cu.siglas as cu_siglas ,
        cu.color as color ,
        cu.ciclo as ciclo ,
        doc.apellidos ,
        doc.nombres ,
        gr.id ,
        gr.cursoid ,
        CASE 
            WHEN gr.id IN {LISTA_GRUPOS} THEN TRUE
            ELSE FALSE
        END as estado
    FROM grupo gr
    inner join curso cu on cu.id = gr.cursoid
    inner join docente doc on doc.id = gr.docenteid
    where gr.semestrecodigo = %s
    order by 1 asc , 2 asc, 3 asc 
    '''
    return bd.sql_select_fetchall(sql,(semestre))


def consult_grupo_id( id ):
    sql = '''
    SELECT 
		gr.semestrecodigo ,
		cu.nombre as cu_nombre,
        gr.nombre as gr_nombre ,
        cu.siglas as cu_siglas ,
        cu.color as color ,
        cu.ciclo as ciclo ,
        doc.apellidos ,
        doc.nombres ,
        gr.id ,
        gr.cursoid
    FROM grupo gr
    inner join curso cu on cu.id = gr.cursoid
    inner join docente doc on doc.id = gr.docenteid
    where gr.id = %s
    order by 1 asc , 2 asc, 3 asc
    '''
    return bd.sql_select_fetchone(sql,( id ))


def get_unidad_grupoid(grupoid):
    sql = '''
    SELECT 
        id, 
        nombre, 
        porcentaje, 
        nro, 
        grupoid 
    FROM unidad 
    WHERE grupoid = %s
    '''
    return bd.sql_select_fetchall(sql,(grupoid))


def get_nota_grupoid(grupoid):
    sql = '''
    SELECT 
        nta.id, 
        nta.nombre, 
        nta.porcentaje, 
        nta.nro, 
        nta.unidadid 
    FROM nota nta
    INNER JOIN unidad ud on ud.id = nta.unidadid
    WHERE ud.grupoid = %s
    '''
    return bd.sql_select_fetchall(sql,(grupoid))


def get_grupos_semestre_matriculaid(semestre , matriculaid):
    sql = '''
    SELECT 
		gr.semestrecodigo ,
		cu.nombre as cu_nombre,
        gr.nombre as gr_nombre ,
        cu.siglas as cu_siglas ,
        cu.color as color ,
        cu.ciclo as ciclo ,
        doc.apellidos ,
        doc.nombres ,
        gr.id ,
        gr.cursoid ,
        CASE 
            WHEN gr.id IN (
            SELECT
            det.grupoid
            FROM detalle_matricula det
            where det.matriculaid = %s           
            ) THEN TRUE
            ELSE FALSE
        END as estado
    FROM grupo gr
    inner join curso cu on cu.id = gr.cursoid
    inner join docente doc on doc.id = gr.docenteid
    where gr.semestrecodigo = %s
    order by 1 asc , 2 asc, 3 asc
    '''
    return bd.sql_select_fetchall(sql,(matriculaid , semestre))


def get_data_grupos_semestre_matriculaid(matriculaid):
    sql = '''
    SELECT 
        cu.nombre as name,
        cu.siglas as letters,
        hor.dia   as day,
        hor.h_ini as hr_ini,
        hor.h_fin as hr_fin,
        cu.color as color,
        cu.ciclo as ciclo,
        gr.nombre as "group",
        doc.apellidos as prof,
        doc.nombres as prof_nom,
        gr.id ,
        CASE 
            WHEN gr.id IN (
            SELECT
            det.grupoid
            FROM detalle_matricula det
            where det.matriculaid = %s    
            ) THEN TRUE
            ELSE FALSE
        END as estado
    FROM grupo gr
    INNER JOIN curso cu ON cu.id = gr.cursoid
    INNER JOIN docente doc ON doc.id = gr.docenteid
    INNER JOIN horario_grupo hor ON hor.grupoid = gr.id
    LEFT JOIN detalle_matricula det ON det.grupoid = gr.id
    ORDER BY 1 ASC, 7 ASC , 4 asc
    '''
    return bd.sql_select_fetchall(sql,(matriculaid ))


def get_grupos():
    sql = '''
    SELECT 
		gr.semestrecodigo ,
		cu.nombre as cu_nombre,
        gr.nombre as gr_nombre ,
        cu.siglas as cu_siglas ,
        cu.color as color ,
        cu.ciclo as ciclo ,
        doc.apellidos ,
        doc.nombres ,
        gr.id ,
        gr.cursoid 
    FROM grupo gr
    inner join curso cu on cu.id = gr.cursoid
    inner join docente doc on doc.id = gr.docenteid
    order by 1 asc , 2 asc, 3 asc 
    '''
    return bd.sql_select_fetchall(sql)



def get_data_grupos_semestrecodigo(semestre):
    sql = f'''
    SELECT 
        cu.nombre as name,
        cu.siglas as letters,
        hor.dia   as day,
        hor.h_ini as hr_ini,
        hor.h_fin as hr_fin,
        cu.color as color,
        cu.ciclo as ciclo,
        gr.nombre as "group",
        doc.apellidos as prof,
        doc.nombres as prof_nom,
        gr.id ,
        CASE 
            WHEN gr.id IN {LISTA_GRUPOS} THEN TRUE
            ELSE FALSE
        END as estado
    FROM grupo gr
    INNER JOIN curso cu ON cu.id = gr.cursoid
    INNER JOIN docente doc ON doc.id = gr.docenteid
    INNER JOIN horario_grupo hor ON hor.grupoid = gr.id
    LEFT JOIN detalle_matricula det ON det.grupoid = gr.id
    WHERE gr.semestrecodigo = %s
    ORDER BY 1 ASC, 7 ASC , 4 asc
    '''
    return bd.sql_select_fetchall(sql,(semestre))


def get_horarios_cursoid(cursoid):
    sql = '''
    SELECT 
        gr.id as gr_id, 
        gr.nombre as gr_nombre , 
        hor.id , 
        hor.dia , 
        hor.h_ini , 
        hor.h_fin, 
        hor.grupoid
    FROM grupo gr
    inner join horario_grupo hor on hor.grupoid = gr.id    
    WHERE cursoid = %s
    order by 4 asc , 5 asc
    '''
    return bd.sql_select_fetchall(sql,(cursoid))


def get_grupos_cursoid(cursoid):
    sql = '''
    SELECT gr.id, gr.nombre, gr.docenteid, gr.semestrecodigo, gr.cursoid , doc.nombres , doc.apellidos
    FROM grupo gr
    left join docente doc on doc.id = gr.docenteid
    WHERE gr.cursoid = %s
    order by 4 desc , 2 asc
    '''
    return bd.sql_select_fetchall(sql,(cursoid))


def get_cursos():
    sql = '''
    select
        cu.id ,
        cu.nombre ,
        cu.siglas ,
        cu.descripcion ,
        cu.ciclo ,
        cu.creditos ,
        cu.icono ,
        cu.color
    from curso cu
    order by 5 desc , 2 asc
    '''
    return bd.sql_select_fetchall(sql)


def get_curso_id(id):
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
    where cu.id = %s
    '''
    return bd.sql_select_fetchone(sql,(id))


def get_ciclos():
    sql = '''
    SELECT DISTINCT ciclo FROM curso 
    where ciclo > 0 
    ORDER BY 1 ASC
    '''
    return bd.sql_select_fetchall(sql)


def get_semestres():
    sql = '''
    SELECT 
        codigo ,
        f_inicio ,
        f_fin ,
        activo
    FROM semestre 
    ORDER BY 1 DESC
    '''
    return bd.sql_select_fetchall(sql)

def options_semestres():
    sql = '''
    SELECT 
        codigo as value,
        codigo as name
    FROM semestre 
    ORDER BY 1 DESC
    '''
    return bd.sql_select_fetchall(sql)


def get_info_semestre_codigo(codigo):
    sql = '''
    SELECT 
        codigo ,
        f_inicio ,
        f_fin ,
        activo
    FROM semestre 
    where codigo = %s
    ORDER BY 1 DESC
    '''
    return bd.sql_select_fetchone(sql,(codigo))


def get_docentes():
    sql = '''
    SELECT id, nombres, apellidos 
    FROM docente 
    ORDER BY 3 ASC
    '''
    return bd.sql_select_fetchall(sql)


def get_grupos_matriculaid( matriculaid ):
    conexion = bd.obtener_conexion()
    with conexion.cursor() as cursor:
        sql = f'''
            SELECT 
                gr.semestrecodigo ,
                cu.nombre as cu_nombre,
                gr.nombre as gr_nombre ,
                cu.siglas as cu_siglas ,
                cu.color as color ,
                cu.ciclo as ciclo ,
                doc.apellidos ,
                doc.nombres ,
                gr.id ,
                gr.docenteid ,
                gr.cursoid
            FROM grupo gr
            inner join curso cu on cu.id = gr.cursoid
            inner join docente doc on doc.id = gr.docenteid
            inner join detalle_matricula det on det.grupoid = gr.id
            where det.matriculaid = %s
            order by 1 asc , 2 asc, 3 asc
        '''
        cursor.execute(sql,( matriculaid ))
        elementos = cursor.fetchall() 
    conexion.close()
    return elementos


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
                IFNULL(ROUND(SUM(ud.porcentaje * (nta.porcentaje * un.valor) / 10000) , 4),0) as prom,
                cu.color
            from curso cu
            left join grupo gr on gr.cursoid = cu.id
            left join unidad ud on ud.grupoid = gr.id
            left join nota nta on nta.unidadid = ud.id
            left join detalle_matricula det on det.grupoid = gr.id 
            LEFT join usuario_nota un on un.notaid = nta.id
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
                ROUND(SUM(nta.porcentaje / 100 * un.valor) , 2) as prom,
                count(nta.id)
            from unidad ud
            left join grupo gr on gr.id = ud.grupoid
            left join nota nta on nta.unidadid = ud.id
            inner join usuario_nota un on un.notaid = nta.id
            where un.usuarioid = 1
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
                un.valor ,
                nta.unidadid as unidad,
                nta.id 
            from nota nta
            inner join usuario_nota un on un.notaid = nta.id
            where un.usuarioid = 1
        '''
        cursor.execute(sql)
        elementos = cursor.fetchall() 
    conexion.close()
    return elementos


def get_contextos():
    sql = f'''
        SELECT 
            id, 
            nombre, 
            descripcion, 
            siglas, 
            icono, 
            color 
        FROM contexto
        order by 2
    '''
    return bd.sql_select_fetchall(sql)


def get_tipos_actividades():
    sql = f'''
        SELECT 
            id, 
            nombre, 
            orden, 
            usuarioid 
        FROM tipo_actividad
        order by 3
    '''
    return bd.sql_select_fetchall(sql)


def get_tabla_info(id):
    sql = '''
    select
        tab.id ,
        tab.nombre ,
        tab.espacioid ,
        tab.ver
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
        tar.id, tar.nombre, tar.descripcion, tbt.orden , 
        tbt.color, tar.tareaid ,
        tbt.columnaid , tbt.filaid , tar.completo
    FROM tarea tar
    left join tabla_tarea tbt on tbt.tareaid = tar.id
    left join columna col on col.id = tbt.columnaid
    where col.tablaid = %s 
    order by tbt.columnaid asc, tbt.filaid asc, tar.completo asc , tbt.orden asc
    '''
    return bd.sql_select_fetchall(sql,(tablaid))


def get_tables():
    sql = '''
        SELECT
        t.id ,
        t.nombre ,
        t.fecha ,
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
    select IFNULL(max(orden),0) as max from tarea
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
        tr.id, 
        tr.nombre, 
        tr.descripcion, 
        tr.color, 
        tr.orden , 
        tr.tareaid,
        (SELECT COUNT(*) FROM tarea h WHERE h.tareaid = tr.id) as cant
    FROM tareas_recursivas tr
    ORDER BY 5 , 7 , 6 , 2  
    '''
    return bd.sql_select_fetchall(sql)


def get_tarea_id(id):
    sql = '''
    SELECT 
        tar.id, tar.nombre, tar.descripcion, tar.color, tar.tareaid , tar.completo
    FROM tarea tar
    where tar.id = %s
    '''
    return bd.sql_select_fetchone(sql,(id))


def get_configuracion():
    sql = '''
    SELECT 
        id, activo, dias, hrs, mins, diff, difh, modo_simple, ver_dias 
    FROM configuracion 
    WHERE activo = 1
    LIMIT 1
    '''
    return bd.sql_select_fetchone(sql)


def get_proyectos_pendientes():
    sql = f'''
    SELECT 
        id, 
        nombre , 
        color ,
        icono , 
        siglas, 
        img ,
        completo ,
        fecha_limite ,
        DATEDIFF(fecha_limite,'{utils.local_datetime_bd()}') AS tiempo
    FROM proyecto 
    WHERE completo != 1
    order by 9
    '''
    return bd.sql_select_fetchall(sql)

# OTROS

def down_orden_columna( columnaid ):
    columna = consult_columna(columnaid)
    orden = columna.get('orden',0)
    tablaid = columna.get('tablaid')

    sql = '''
        SELECT 
            id, IFNULL(orden,0) as orden
        FROM columna
        WHERE tablaid = %s AND orden < %s
        ORDER BY orden DESC
        LIMIT 1
    '''
    low_col = bd.sql_select_fetchone(sql, (tablaid , orden) )

    update_columna_orden( low_col.get('orden') , columnaid )
    update_columna_orden( orden , low_col.get('id') )


def up_orden_columna( columnaid ):
    columna = consult_columna(columnaid)
    orden = columna.get('orden',0)
    tablaid = columna.get('tablaid')

    sql = '''
        SELECT id, IFNULL(orden,1)  as orden 
        FROM columna
        WHERE tablaid = %s AND orden > %s
        ORDER BY orden ASC
        LIMIT 1
    '''
    high_col = bd.sql_select_fetchone(sql, (tablaid , orden) )

    update_columna_orden( high_col.get('orden') , columnaid )
    update_columna_orden( orden , high_col.get('id') )


# def reorder_columna( columanid ):
#     col = consult_columna(columanid)
#     orden = col.get('orden',0)
#     tablaid = col.get('tablaid')
#     sql = ''

#     if modo == 'M':
#         sql = '''
#             SELECT id, IFNULL(orden,1)  as orden 
#             FROM fila
#             WHERE tablaid = %s AND orden > %s
#             ORDER BY orden ASC
#             LIMIT 1
#         '''
#     elif modo == 'm':
#         sql = '''
#             SELECT 
#                 id, IFNULL(orden,0) as orden
#             FROM fila  
#             WHERE tablaid = %s AND orden < %s
#             ORDER BY orden DESC
#             LIMIT 1
#         '''

#     sel = bd.sql_select_fetchone(sql, (tablaid , orden) )



def change_orden_fila( filaid , modo ):
    fila = consult_fila(filaid)
    orden = fila.get('orden',0)
    tablaid = fila.get('tablaid')
    sql = ''

    if modo == 'M':
        sql = '''
            SELECT id, IFNULL(orden,1)  as orden 
            FROM fila
            WHERE tablaid = %s AND orden > %s
            ORDER BY orden ASC
            LIMIT 1
        '''
    elif modo == 'm':
        sql = '''
            SELECT 
                id, IFNULL(orden,0) as orden
            FROM fila  
            WHERE tablaid = %s AND orden < %s
            ORDER BY orden DESC
            LIMIT 1
        '''

    sel = bd.sql_select_fetchone(sql, (tablaid , orden) )

    update_fila_orden( sel.get('orden') , filaid )
    update_fila_orden( orden , sel.get('id') )


def register_tabla_tarea( filaid , columnaid ):
    # cfil = get_bd_color('fila' , filaid )
    # ccol = get_bd_color('columna' , columnaid )
    # color = utils.mix_colors(cfil,ccol) 
    color = None

    tareaid = insert_tarea(f'Nueva_tarea', None , color , 0 , None)
    orden = get_max_min_orden_tabla_tarea(columnaid , filaid)
    max = orden.get('max') + 1
    tabid = insert_tabla_tarea(tareaid, filaid ,columnaid , color , max )

    return tareaid


def change_estado_paleta( pid ):
    sql1 = '''
        UPDATE paleta SET 
        estado = 1
        WHERE id = %s
    '''
    bd.sql_execute(sql1,( pid ))
    
    sql2 = '''
        UPDATE paleta SET 
        estado = 0
        WHERE id != %s
    '''
    bd.sql_execute(sql2,( pid ))


def check_tarea( id ):
    sql = '''
        UPDATE tarea SET 
        completo = 1 - completo
        WHERE id = %s
    '''
    bd.sql_execute(sql,( id ))


def ver_tareas_tabla( id ):
    sql = '''
        UPDATE tabla SET 
        ver = 1 - ver
        WHERE id = %s
    '''
    bd.sql_execute(sql,( id ))


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


def consult_local_datetime_bd():
    sql = f'''
    select
        {utils.local_datetime_bd()} as now
    from tarea
    '''
    # return bd.sql_select_fetchone(sql).get('now')
    return utils.local_datetime_bd()
