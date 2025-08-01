from flask import Flask, render_template, request, redirect, flash, jsonify, session, make_response,  redirect, url_for
from datetime import datetime, date , timedelta 
import controlador
import utils
from decimal import Decimal
import inspect
import bd

app = Flask(__name__)


@app.context_processor
def inject_globals():
    # print(utils.local_time())
    return dict(
        MENU = utils.ENLACES_MENU ,
        dias = utils.BASE_NOMBRE_DIAS ,

    )


matriculaid = 1
tablaid = 1
SEMESTRE = utils.SEMESTRE
USUARUIOID = 1

# controlador.update_cursos_color(  'yellow' ,  '#ffff33' )

@app.route("/")
def main_page():
    return redirect(url_for('horario'))

@app.route("/index")
def index():
    progreso_semestre = controlador.get_progreso_ciclo()
    promedio_general = controlador.get_promedio_final(1) 

    promedio_cursos = controlador.obtener_cursos(1)
    cursos = [r['siglas'] for r in promedio_cursos]
    nombres_completos = [r['nombre'] for r in promedio_cursos]
    promedios = [round(float(r['prom'])) for r in promedio_cursos] 

    return render_template(
        "index.html",
        promedio_general = promedio_general ,
        promedio_cursos = promedio_cursos ,
        progreso_semestre = progreso_semestre ,
        cursos = cursos ,
        promedios = promedios,
        nombres_completos = nombres_completos ,
    )


@app.route("/notas")
def notas():
    semestre = SEMESTRE
    usuarioid = USUARUIOID

    cursos = controlador.obtener_cursos( matriculaid )
    unidades = controlador.obtener_unidades()
    notas = controlador.obtener_notas()
    return render_template(
        "notas.html" ,
        cursos = cursos ,
        unidades = unidades ,
        notas = notas ,
    )


@app.route("/docentes")
def docentes():
    titulo = 'Docentes'
    funcion = 'guardar_docente'

    form_fields = [
#       ID/NAME       LABEL       PLACEHOLDER    TYPE    REQUIRED   ABLE/DISABLE   DATOS
        ['apellidos',  'Apellidos', 'Apellidos',    'text',  True ,     True ,        None ],
        ['nombres',    'Nombres',   'Nombres',    'text',  True ,     True ,        None ],
    ]

    docentes = controlador.get_docentes()
    lista = []

    for d in docentes:
        f = f'{d["apellidos"]}, {d["nombres"]} ({d["id"]})'
        lista.append(f)

    return render_template(
        "FORM_CRUD.html" ,
        lista = lista ,
        titulo = titulo ,
        funcion = funcion ,
        form_fields = form_fields ,
    )


@app.route("/cursos")
def cursos():
    cursos = controlador.get_cursos()
    ciclos = controlador.get_ciclos()
    return render_template(
        "cursos.html" ,
        cursos = cursos ,
        ciclos = ciclos, 
    )


@app.route("/grupos_curso/<int:id>")
def grupos_curso(id):
    curso = controlador.get_curso_id(id)
    semestres = controlador.get_semestres()
    docentes = controlador.get_docentes()
    grupos = controlador.get_grupos_cursoid(id)
    horarios = controlador.get_horarios_cursoid(id)

    return render_template(
        "grupo.html" ,
        curso = curso ,
        semestres = semestres , 
        docentes = docentes ,
        grupos = grupos ,
        horarios = horarios ,
    )


@app.route("/test")
def test():
    return render_template(
        "crear_grupo.html" ,
    )


@app.route("/grupos")
def grupos():
    todos_cursos = controlador.get_cursos()
    semestres = controlador.get_semestres()
    docentes = controlador.get_docentes()
    ciclos = controlador.get_ciclos_grupos()
    cursos = controlador.get_cursos_grupo()
    grupos = controlador.get_grupos()
    horarios = controlador.get_horario_grupo()
    return render_template(
        "grupos.html" ,
        todos_cursos = todos_cursos ,
        ciclos = ciclos ,
        docentes = docentes ,
        cursos = cursos ,
        grupos = grupos ,
        horarios = horarios ,
        semestres = semestres ,
    )


@app.route("/horario")
def horario():
    actual = request.args.get('semestre')
    semestre = actual if actual else SEMESTRE
    data = controlador.get_grupos_semestre(semestre)
    return render_template(
        "horario.html" ,
        data = data ,
        semestre = semestre ,
    )


@app.route("/data_grupo/<semestre>")
def data_grupo(semestre):
    data = controlador.get_grupos_semestre(semestre)
    return render_template(
        'data_grupo.html' ,
        data = data ,
    ) 


# @app.route("/test")
# def test():
#     id = request.args.get('id') 
#     tareaid = id if id else None
#     tarea_info = controlador.get_tarea_id(tareaid) if tareaid else {}
#     tareas_planas = controlador.get_tareas(tareaid) 
#     tareas_arbol = construir_arbol_tareas(tareas_planas)
#     return render_template(
#         "test.html" ,
#         tareaid = tareaid ,
#         tareas = tareas_arbol ,
#         tarea_info = tarea_info ,
#     )


@app.route('/nueva_tarea')
def nueva_tarea():
    id = request.args.get('id') 
    tareaid = id if id else None
    orden = controlador.get_orden_tarea(tareaid).get('max') + 1
    date = utils.format_now("%Y-%m-%d %H:%M:%S")
    tarea = controlador.get_tarea_id(tareaid)
    color = tarea.get('color') if tarea else '#fff'
    controlador.insert_tarea( f'Nueva tarea {date}', None , color , orden , tareaid )
    if id:
        return redirect(url_for('tareas' , id = tareaid))
    else:
        return redirect(url_for('tareas'))


@app.route("/tareas")
def tareas():
    id = request.args.get('id') 
    tareaid = id if id else None
    tarea_info = controlador.get_tarea_id(tareaid) if tareaid else {}
    tareas_planas = controlador.get_tareas(tareaid) 
    tareas_arbol = construir_arbol_tareas(tareas_planas)
    return render_template(
        "arbol.html" ,
        tareaid = tareaid ,
        tareas = tareas_arbol ,
        tareas_planas = tareas_planas ,
        tarea_info = tarea_info ,
    )


def construir_arbol_tareas(tareas):
    tarea_dict = {t["id"]: dict(t, hijos=[]) for t in tareas}
    raiz = []

    for tarea in tarea_dict.values():
        padre_id = tarea["tareaid"]
        if padre_id is not None and padre_id in tarea_dict:
            tarea_dict[padre_id]["hijos"].append(tarea)
        else:
            raiz.append(tarea)

    return raiz


@app.route("/mis_tablas")
def tablas():
    tablas = controlador.get_tables()
    return render_template(
        "tablas.html" ,
        tablas = tablas ,
    )


@app.route("/tabla/<int:tablaid>")
def ver_tabla(tablaid):
    tabla_info = controlador.get_tabla_info(tablaid)
    columnas = controlador.get_columnas_tablaid(tablaid)
    filas = controlador.get_filas_tablaid(tablaid)
    tareas = controlador.get_tareas_tablaid(tablaid)
    return render_template(
        "ver_tabla.html" ,
        tabla_info = tabla_info ,
        columnas = columnas ,
        filas = filas ,
        tareas = tareas ,
    )


@app.route('/nueva_tabla')
def nueva_tabla():
    date = utils.format_now("%Y-%m-%d")
    id = controlador.insert_tabla( f'Nueva tabla {date}', 1 )
    return redirect(url_for('ver_tabla' , tablaid = id ))


######################## METODOS POST ########################

@app.route('/guardar_tabla_elemento', methods=['POST'])
def guardar_tabla_elemento():
    e = request.args.get('elemento')

    if e == 'columna':
        f = controlador.insert_columna
    elif e == 'fila':
        f = controlador.insert_fila
    elif e == 'tarea':
        f = controlador.insert_tarea

    firma = inspect.signature(f)
    valores = []
    for nombre, parametro in firma.parameters.items():
        valor = request.form.get(nombre) if nombre != 'tablaid' else tablaid
        valores.append(valor)
    f( *valores )

    return redirect(url_for('ver_tabla'))


@app.route('/update_row', methods=['POST'])
def update_row():
    args_page = request.args.get('page')
    page = args_page if args_page else 'index'

    f = controlador.update_tarea_tabla
    valores = utils.request_values_parameters(f)
    f(*valores)

    return redirect(url_for(page))


@app.route('/update_column_table_id', methods=['POST'])
def update_column_table_id():
    try:
        data = request.get_json()
        tabla =   data.get("tabla")
        columna = data.get("columna")
        valor =   data.get('valor')
        id =      data.get('id')

        bd.bd_update(tabla, [columna], [valor], " id = %s ", [id])

        rpta = f''' Tabla: {tabla} , Columna: {columna} , Valor: {valor} , ID: {id} '''
        return jsonify({'respuesta': rpta})
    except Exception as e:
        return jsonify({"error": str(e)}), 500


@app.route('/guardar_nota', methods=['POST'])
def guardar_nota():
    try:
        data = request.get_json()
        id_nota = data.get('id')
        nueva_nota = data.get('nota')

        if id_nota is None or nueva_nota is None:
            return jsonify({"success": False, "error": "Datos inválidos"}), 400

        try:
            nueva_nota = Decimal(nueva_nota)  # Usa Decimal para evitar problemas con NUMERIC(5,2)
        except:
            return jsonify({"success": False, "error": "Formato de nota inválido"}), 400

        nueva_nota = max(Decimal('0.00'), min(Decimal('20.00'), nueva_nota))  # Limita el valor entre 0 y 20

        controlador.actualizar_valor_nota_id(nueva_nota, id_nota)

        return jsonify({"success": True})
    except Exception as e:
        return jsonify({"success": False, "error": str(e)}), 500


@app.route('/guardar_docente', methods=['POST'])
def guardar_docente():
    f = controlador.insert_docente
    valores = utils.request_values_parameters(f)
    f( *valores )
    return redirect(url_for('docentes'))


@app.route('/guardar_grupo', methods=['POST'])
def guardar_grupo():
    cursoid = request.form['cursoid']
    f = controlador.insert_grupo
    valores = utils.request_values_parameters(f)
    f( *valores )

    return redirect(url_for('grupos_curso',id = cursoid))


@app.route('/guardar_horario_grupo', methods=['POST'])
def guardar_horario_grupo():
    cursoid = request.form['cursoid']
    f = controlador.insert_horario_grupo
    valores = utils.request_values_parameters(f)
    f( *valores )

    return redirect(url_for('grupos_curso',id = cursoid))


@app.route('/guardar_grupo_horarios', methods=['POST'])
def guardar_grupo_horarios():
    f = controlador.insert_grupo_horarios
    valores = utils.request_values_parameters(f)
    f( *valores )

    return redirect(url_for('grupos'))





if __name__ == "__main__":
    app.run(host='0.0.0.0', port=9000, debug=True)
