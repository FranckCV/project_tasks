from controladores.bd import obtener_conexion
from datetime import datetime, date , timedelta 

def formato_fecha_bd(date):
    return date.strftime("%Y-%m-%d")


def obtener_max_minuto_acts():
    conexion = obtener_conexion()
    with conexion.cursor() as cursor:
        sql = '''
            SELECT MAX(hor.`min_ini`) , MAX(hor.`min_fin`) FROM `horario` hor;
        '''
        cursor.execute(sql)
        elementos = cursor.fetchone() 
    conexion.close()

    if elementos[0] < elementos[1]:
        return elementos[1]
    else:
        return elementos[0]


def obtener_acts():
    conexion = obtener_conexion()
    with conexion.cursor() as cursor:
        sql = '''
            select 
                ctx.id ,

                ctx.nombre ,
                ctx.descripcion ,
                hor.dia ,
                
                hor.h_ini ,
                hor.min_ini ,
                hor.h_fin ,
                hor.min_fin ,

                hor.fecha_ini ,
                hor.fecha_fin ,
                ctx.id ,
                ctx.color ,

                hor.h_fin * 60 + hor.min_fin - (hor.h_ini + 1) * 60 + 60 - hor.min_ini ,

                ctx.id 
            from horario hor 
            inner join contexto ctx on ctx.id = hor.contextoid
        '''
        cursor.execute(sql)
        elementos = cursor.fetchall() 
    conexion.close()
    return elementos


def obtener_horarios_fecha():
    conexion = obtener_conexion()

    # fechamod = fecha
    # print(fechamod)

    with conexion.cursor() as cursor:
        sql = f'''
            select 
                ctx.id ,

                ctx.nombre ,
                ctx.color ,
                hor.dia ,
                
                hor.h_ini ,
                hor.min_ini ,
                hor.h_fin ,
                hor.min_fin ,

                hor.fecha_ini ,
                hor.fecha_fin ,
                ctx.id ,
                ctx.descripcion ,

                hor.h_fin * 60 + hor.min_fin - (hor.h_ini + 1) * 60 + 60 - hor.min_ini ,

                ctx.id 
            from horario hor 
            inner join contexto ctx on ctx.id = hor.contextoid
            where hor.fecha_ini <= CURRENT_DATE and CURRENT_DATE <= hor.fecha_fin
        '''
        # print(sql)
        cursor.execute(sql)
        elementos = cursor.fetchall() 
    conexion.close()
    return elementos


def obtener_tareas_fecha():
    conexion = obtener_conexion()

    with conexion.cursor() as cursor:
        sql = f'''
            select 
                ctx.id ,

                ctx.nombre ,
                ctx.color ,
                ctx.descripcion ,

                hor.dia ,
                
                hor.h_ini ,
                hor.min_ini ,
                hor.h_fin ,
                hor.min_fin ,

                hor.fecha_ini ,
                hor.fecha_fin ,

                hor.titulo ,
                hor.descripcion ,

                ctx.letras ,
                ctx.icono ,
                ctx.img ,

                hor.id 
            from contexto ctx 
            left join horario hor on ctx.id = hor.contextoid
            where hor.fecha_ini <= CURRENT_DATE and CURRENT_DATE <= hor.fecha_fin 
            order by
                CASE 
                    WHEN hor.dia >= (DAYOFWEEK(CURRENT_DATE) + 1) THEN 0 
                    ELSE 1  
                END,
                hor.dia, 
                hor.h_ini, 
                hor.min_ini, 
                hor.h_fin;

        '''
        # print(sql)
        cursor.execute(sql)
        elementos = cursor.fetchall() 
    conexion.close()
    return elementos


strSQL_tareas = f'''
    select 
        ctx.id ,

        ctx.nombre ,
        ctx.color ,
        ctx.descripcion ,

        hor.dia ,
        
        hor.h_ini ,
        hor.min_ini ,
        hor.h_fin ,
        hor.min_fin ,

        hor.fecha_ini ,
        hor.fecha_fin ,

        hor.titulo ,
        hor.descripcion ,

        ctx.letras ,
        ctx.icono ,
        ctx.img ,

        hor.id 
    from horario hor 
    left join contexto ctx on ctx.id = hor.contextoid
'''


def obtener_tareas_maniana():
    conexion = obtener_conexion()

    # fechamod = fecha.strftime("%Y-%m-%d")
    # dia = fecha.weekday() + 1
    # hora = fecha.hour  

    with conexion.cursor() as cursor:
        sql = strSQL_tareas + f'''
            where hor.fecha_ini <= CURRENT_DATE
            and CURRENT_DATE <= hor.fecha_fin 
            and  hor.dia = (DAYOFWEEK(CURRENT_DATE) ) % 7

            order by hor.h_ini , hor.min_ini , hor.h_fin
        '''
        # or ( hor.dia = (DAYOFWEEK(CURRENT_DATE) )
        # print(sql)
        cursor.execute(sql)
        elementos = cursor.fetchall() 
    conexion.close()
    return elementos


def obtener_tareas_hoy():
    conexion = obtener_conexion()

    # fechamod = fecha.strftime("%Y-%m-%d")
    # dia = fecha.weekday() + 1
    # hora = fecha.hour  

    with conexion.cursor() as cursor:
        sql = strSQL_tareas + f'''
            where hor.fecha_ini <= CURRENT_DATE
            and CURRENT_DATE <= hor.fecha_fin 
            and  hor.dia = (DAYOFWEEK(CURRENT_DATE) - 1 ) % 7
            and (HOUR(CURRENT_TIME)) < hor.h_fin 

            order by hor.h_ini , hor.min_ini , hor.h_fin
        '''
        # or ( hor.dia = (DAYOFWEEK(CURRENT_DATE) )
        # print(sql)
        cursor.execute(sql)
        elementos = cursor.fetchall() 
    conexion.close()
    return elementos


def obtener_tareas_sinfecha():
    conexion = obtener_conexion()

    with conexion.cursor() as cursor:
        sql = strSQL_tareas + f'''
            where hor.fecha_ini is NULL 
            and hor.fecha_fin is NULL
            and hor.dia is NULL

        '''
        # print(sql)
        cursor.execute(sql)
        elementos = cursor.fetchall() 
    conexion.close()
    return elementos


def obtener_tareas_hoy_test(fecha):
    conexion = obtener_conexion()

    fechamod = fecha.strftime("%Y-%m-%d")
    dia = fecha.weekday() + 1
    hora = fecha.hour  

    with conexion.cursor() as cursor:
        sql = f'''
            select 
                ctx.id ,

                ctx.nombre ,
                ctx.color ,
                ctx.descripcion ,

                hor.dia ,
                
                hor.h_ini ,
                hor.min_ini ,
                hor.h_fin ,
                hor.min_fin ,

                hor.fecha_ini ,
                hor.fecha_fin ,

                hor.titulo ,
                hor.descripcion ,

                ctx.letras ,
                ctx.icono ,
                ctx.img ,

                hor.id 
            from contexto ctx 
            left join horario hor on ctx.id = hor.contextoid
            where hor.fecha_ini <= '{fechamod}' and '{fechamod}' <= hor.fecha_fin 
            and hor.dia = {dia} and {hora} <= hor.h_ini 
            order by hor.fecha_ini desc , hor.dia , hor.h_ini , hor.min_ini , hor.h_fin
        '''
        # print(sql)
        cursor.execute(sql)
        elementos = cursor.fetchall() 
    conexion.close()
    return elementos


def obtener_info_notas():
    conexion = obtener_conexion()
    with conexion.cursor() as cursor:
        sql = '''
            select
                * 
            from curso cu
            left join unidad ud on ud.cursoid = cu.id
            left join nota nta on nta.unidadid = ud.id
        '''
        cursor.execute(sql)
        elementos = cursor.fetchall() 
    conexion.close()
    return elementos


def obtener_cursos(ciclo):
    conexion = obtener_conexion()
    with conexion.cursor() as cursor:
        sql = f'''
            select
                cu.id ,
                cu.nombre ,
                cu.creditos ,
                cu.ciclo ,
                count(DISTINCT ud.id) ,
                ROUND(SUM(ud.porcentaje * (nta.porcentaje * nta.valor) / 10000) , 2) ,
                cu.color
            from curso cu
            left join unidad ud on ud.cursoid = cu.id
            left join nota nta on nta.unidadid = ud.id
            where cu.ciclo = {ciclo}
            GROUP BY cu.id
            order by cu.creditos 
        '''
        cursor.execute(sql)
        elementos = cursor.fetchall() 
    conexion.close()
    return elementos


def obtener_unidades():
    conexion = obtener_conexion()
    with conexion.cursor() as cursor:
        sql = '''
            select
                ud.id ,
                ud.nombre ,
                ud.porcentaje ,
                ud.cursoid ,
                ROUND(SUM(nta.porcentaje / 100 * nta.valor) , 2),
                count(nta.id)
            from unidad ud
            left join nota nta on nta.unidadid = ud.id
            GROUP BY ud.id
        '''
        cursor.execute(sql)
        elementos = cursor.fetchall() 
    conexion.close()
    return elementos


def obtener_notas():
    conexion = obtener_conexion()
    with conexion.cursor() as cursor:
        sql = '''
            select
                nta.id ,
                nta.nombre ,
                nta.porcentaje ,
                nta.valor ,
                nta.unidadid ,
                nta.id 
            from nota nta
        '''
        cursor.execute(sql)
        elementos = cursor.fetchall() 
    conexion.close()
    return elementos


def actualizar_valor_nota_id(valor,id):
    conexion = obtener_conexion()
    sql = '''
        UPDATE nota SET valor = '''+str(valor)+''' WHERE id = '''+str(id)+'''
    '''
    with conexion.cursor() as cursor:
        cursor.execute(sql)
    conexion.commit()
    conexion.close()




