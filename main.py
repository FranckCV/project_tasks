from flask import Flask, render_template, request, redirect, flash, jsonify, session, make_response,  redirect, url_for
from datetime import datetime, date , timedelta 
import controlador
import utils
import values
from decimal import Decimal
import inspect
import bd
from functools import wraps
import markdown
import os

app = Flask(__name__)

def validar_usuario():
    def decorator(f):
        @wraps(f)
        def wrapper(*args, **kwargs):
            try:
                username = request.cookies.get('username')
                if username :
                    page = f(*args, **kwargs)
                    if page:
                        return page
                    else:
                        return rdrct_error( redirect('/index') , 'PAGINA_NO_EXISTE') 
                return rdrct_error(redirect_url('login') , 'LOGIN_INVALIDO') 
            except Exception as e:
                return rdrct_error(redirect_url('login') , e) 
        return wrapper
    return decorator



@app.context_processor
def inject_globals():
    main_paleta = controlador.get_paleta_actual()
    return dict(
        MENU = values.ENLACES_MENU ,
        CRUD_FORMS = values.CRUD_FORMS ,
        dias = values.BASE_NOMBRE_DIAS ,
        USUARUIOID = values.USUARIOID,
        dato_usuario = values.USUARIO ,
        main_paleta = main_paleta ,
    )


matriculaid = 1
tablaid = 1

# controlador.update_cursos_color(  'yellow' ,  '#ffff33' )

@app.route("/")
def main_page():
    return redirect(url_for('login'))


@app.route("/index")
# @validar_usuario()
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


@app.route("/configuracion")
@validar_usuario()
def configuracion():
    paletas = controlador.get_paleta()
    paleta_actual = controlador.get_paleta_actual()
    return render_template(
        "configuracion.html",
        paletas = paletas ,
        paleta_actual = paleta_actual ,
    )


@app.route("/matriculas")
@validar_usuario()
def matriculas():
    matriculas = controlador.get_matriculas()
    semestres = controlador.get_semestres()
    return render_template(
        "matriculas.html" ,
        matriculas = matriculas ,
        semestres = semestres ,
    )


# @app.route("/paleta")
# @validar_usuario()
# def paleta():
#     return render_template(
#         "configuracion.html",
#     )


@app.route("/matricula")
# @validar_usuario()
def matricula():
    id = request.args.get('id')
    matricula = controlador.consult_matricula_id(id)
    matricula_grupos = controlador.get_grupos_matriculaid(id)
    semestre = matricula.get('semestrecodigo')

    ciclos = controlador.get_ciclos_grupos_semestre(semestre)
    cursos = controlador.get_cursos_grupo_semestre(semestre)
    grupos = controlador.get_grupos_semestre_matriculaid(semestre,id)
    horarios = controlador.get_horario_grupo()

    data = controlador.get_data_grupos_semestre_matriculaid(id)
    return render_template(
        "matricula.html" ,
        matricula = matricula ,
        semestre = semestre ,
        ciclos = ciclos ,
        cursos = cursos ,
        grupos = grupos ,
        matricula_grupos = matricula_grupos,
        horarios = horarios ,
        data = data ,
        modo_form = True ,
    )


@app.route("/grupo")
@validar_usuario()
def grupo():
    id = request.args.get('id')
    grupo = controlador.consult_grupo_id(id)
    unidades = controlador.get_unidad_grupoid(id)
    notas = controlador.get_nota_grupoid(id)
    return render_template(
        "grupo_unidades.html" ,
        grupo = grupo ,
        unidades = unidades ,
        notas = notas ,
    )


@app.route("/horario_matricula")
@validar_usuario()
def horario_matricula():
    id = request.args.get('id')
    matricula = controlador.consult_matricula_id(id)
    matricula_grupos = controlador.get_grupos_matriculaid(id)
    semestre = matricula.get('semestrecodigo')

    ciclos = controlador.get_ciclos_grupos_semestre(semestre)
    cursos = controlador.get_cursos_grupo_semestre(semestre)
    grupos = controlador.get_grupos_semestre_matriculaid(semestre,id)
    horarios = controlador.get_horario_grupo()

    data = controlador.get_data_grupos_semestre_matriculaid(id)
    return render_template(
        "horario.html" ,
        matricula = matricula ,
        semestre = semestre ,
        ciclos = ciclos ,
        cursos = cursos ,
        grupos = grupos ,
        horarios = horarios ,
        data = data ,
        modo_form = True ,
    )


@app.route("/semestres")
@validar_usuario()
def semestres():
    semestres = controlador.get_semestres()

    return render_template(
        "semestres.html" ,
        semestres = semestres ,
    )


@app.route("/semestre")
@validar_usuario()
def semestre():
    codigo = request.args.get('codigo')
    semestre = controlador.get_info_semestre_codigo(codigo)
    grupos = controlador.get_grupos_semestre(codigo)
    horarios = controlador.get_horario_grupo()
    dias = values.BASE_NOMBRE_DIAS
    return render_template(
        "semestre.html" ,
        grupos = grupos ,
        semestre = semestre ,
        horarios = horarios ,
        dias = dias , 
    )


@app.route("/notas")
@validar_usuario()
def notas():
    # semestre = SEMESTRE
    # usuarioid = USUARUIOID

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
@validar_usuario()
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
        "docentes.html" ,
        lista = lista ,
        titulo = titulo ,
        funcion = funcion ,
        form_fields = form_fields ,
    )


@app.route("/cursos")
@validar_usuario()
def cursos():
    cursos = controlador.get_cursos()
    ciclos = controlador.get_ciclos()
    return render_template(
        "cursos.html" ,
        cursos = cursos ,
        ciclos = ciclos, 
    )


@app.route("/grupos_curso/<int:id>")
@validar_usuario()
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
@validar_usuario()
def test():
    return render_template(
        "crear_grupo.html" ,
    )


@app.route("/grupos")
@validar_usuario()
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
# @validar_usuario()
def horario():
    actual = request.args.get('semestre')
    semestre = actual if actual else values.SEMESTRE
    ciclos = controlador.get_ciclos_grupos_semestre(semestre)
    cursos = controlador.get_cursos_grupo_semestre(semestre)
    grupos = controlador.get_grupos_semestre(semestre)
    horarios = controlador.get_horario_grupo()

    data = controlador.get_data_grupos_semestrecodigo(semestre)
    return render_template(
        "horario.html" ,
        semestre = semestre ,
        ciclos = ciclos ,
        cursos = cursos ,
        grupos = grupos ,
        horarios = horarios ,
        data = data ,
        matricula = {} ,
    )


@app.route("/data_grupo/<semestre>")
@validar_usuario()
def data_grupo(semestre):
    data = controlador.get_grupos_semestre(semestre)
    return render_template(
        'data_grupo.html' ,
        data = data ,
    ) 


@app.route("/tareas")
@validar_usuario()
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


@app.route("/tablas")
# @validar_usuario()
def tablas():
    tablas = controlador.get_tables()
    return render_template(
        "tablas.html" ,
        tablas = tablas ,
    )


@app.route("/tabla/<int:tablaid>")
# @validar_usuario()
def tabla(tablaid):
    tabla_info = controlador.get_tabla_info(tablaid)
    columnas = controlador.get_columnas_tablaid(tablaid)
    filas = controlador.get_filas_tablaid(tablaid)
    tareas = controlador.get_tareas_tablaid(tablaid)
    return render_template(
        "tabla.html" ,
        tabla_info = tabla_info ,
        columnas = columnas ,
        filas = filas ,
        tareas = tareas ,
    )


@app.route("/unidades")
# @validar_usuario()
def unidades():
    semestres = controlador.get_semestres()
    grupos = controlador.get_grupos_matriculados()
    ciclos = controlador.get_ciclos_grupos_matriculados()
    cursos = controlador.get_cursos_grupos_matriculados
    return render_template(
        "unidades.html" ,
        grupos = grupos ,
        semestres= semestres ,
        ciclos = ciclos ,
        cursos = cursos ,
    )


@app.route('/change_paleta')
@validar_usuario()
def change_paleta():
    id = request.args.get('id')
    controlador.change_estado_paleta(id)
    return redirect_url('configuracion')


@app.route('/delete_paleta')
@validar_usuario()
def delete_paleta():
    id = request.args.get('id')
    controlador.delete_paleta(id)
    return redirect_url('configuracion')


@app.route('/nueva_tarea')
@validar_usuario()
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


@app.route('/nueva_tabla')
@validar_usuario()
def nueva_tabla():
    date = utils.format_now("%Y%m%d%H%M%S")
    id = controlador.insert_tabla( f'Nueva tabla {date}', 1 )
    return redirect(url_for('tabla' , tablaid = id ))


@app.route('/nueva_matricula')
@validar_usuario()
def nueva_matricula():
    user_id = request.cookies.get('id')
    semestre = request.args.get('semestre')
    date = utils.format_now("%Y%m%d%H%M%S") 
    controlador.insert_matricula( f'Modelo {semestre} {date}', semestre , user_id )
    return redirect(url_for('matriculas'))


@app.route('/nueva_columna')
@validar_usuario()
def nueva_columna():
    tablaid = request.args.get('tablaid')
    date = utils.format_now("%Y%m%d%H%M%S") 
    orden = controlador.get_max_min_orden_element_tabla('C' , tablaid).get('max') + 1
    controlador.insert_columna(f'Columna{date}', values.COLOR_DEFAULT , orden ,tablaid )
    return redirect(url_for('tabla' , tablaid = tablaid))


@app.route('/nueva_fila')
@validar_usuario()
def nueva_fila():
    tablaid = request.args.get('tablaid')
    date = utils.format_now("%Y%m%d%H%M%S")
    orden = controlador.get_max_min_orden_element_tabla('F' , tablaid).get('max') + 1
    controlador.insert_fila(f'Fila{date}', values.COLOR_DEFAULT , orden ,tablaid )
    return redirect(url_for('tabla' , tablaid = tablaid))


@app.route('/nueva_tabla_tarea')
@validar_usuario()
def nueva_tabla_tarea():
    tablaid = request.args.get('tablaid')
    filaid = request.args.get('filaid')
    columnaid = request.args.get('columnaid')
    controlador.register_tabla_tarea( filaid , columnaid )
    return redirect(url_for('tabla' , tablaid = tablaid))


@app.route('/change_ver_tabla')
@validar_usuario()
def change_ver_tabla():
    tablaid = request.args.get('tablaid')
    controlador.ver_tareas_tabla( tablaid )

    return redirect(url_for('tabla' , tablaid = tablaid))


@app.route('/info')
# @validar_usuario()
def info():
    return render_template(
        '_info.html' ,
    )


MD_FILE = "README.md"

@app.route("/get_markdown")
def get_markdown():
    if os.path.exists(MD_FILE):
        with open(MD_FILE, "r", encoding="utf-8") as f:
            return f.read()
    return ""

@app.route("/save_markdown", methods=["POST"])
def save_markdown():
    data = request.get_json()
    with open(MD_FILE, "w", encoding="utf-8") as f:
        f.write(data.get("content", ""))
    return jsonify({"msg": "Markdown guardado con éxito ✅"})


@app.route("/login")
def login():
    username = request.cookies.get('username')
    user_username = values.USUARIO.get('username')
    if username and user_username == username: 
        return redirect('/index')
    resp = make_response(render_template('login.html'))
    resp.delete_cookie('username')
    return resp


@app.route("/procesar_login", methods=["POST"])
def procesar_login():
    try:
        username = request.form["username"]
        password = request.form["password"]
        resp = resp_login( username , password )
        return resp
    except Exception as e:
        return rdrct_error(redirect_url('login')  , e)


@app.route("/logout")
def logout():
    try:
        resp = make_response(redirect_login())
        resp.delete_cookie('username')
        resp.delete_cookie('correo')
        resp.delete_cookie('id')
        return resp
    except Exception as e:
        return rdrct_error(redirect_login(),e)


def resp_login( username , password ):
    user_id       = values.USUARIO.get('id')
    user_username = values.USUARIO.get('username')
    user_password = values.USUARIO.get('password')
    if user_username == username and user_password == password:
        resp = make_response(redirect_url('login'))
        resp.set_cookie('id', str(user_id))
        resp.set_cookie('username', username)
        return resp
    else:
        return rdrct_error(redirect_url('login') ,'LOGIN_INVALIDO')


def rdrct_error(resp_redirect , e):
    resp = make_response(resp_redirect)
    error_message = str(e)

    for clave in values.ERRORES:
        if clave in error_message:
            msg = values.ERRORES[clave]
            break 
    else:
        msg =  'ERROR DESCONOCIDO ENCONTRADO: '+error_message

    resp.set_cookie('error', msg , max_age=30)
    return resp 


def redirect_login():
    # return redirect(url_for('panel'))
    return redirect_url('login')


def redirect_url(url):
    return redirect(url_for(url))




######################## METODOS POST ########################


@app.route('/update_tabla_tarea_celda')
def update_tabla_tarea_celda():
    orden = request.args.get('orden')
    ncolumnaid = request.args.get('ncolumnaid')
    nfilaid = request.args.get('nfilaid')
    columnaid = request.args.get('columnaid')
    filaid = request.args.get('filaid')
    tareaid = request.args.get('tareaid')
    
    controlador.update_tabla_tarea_celda( orden , ncolumnaid , nfilaid , columnaid, filaid , tareaid)

    return jsonify({'respuesta_orden': orden})


@app.route('/delete_columna') 
def delete_columna():
    columnaid = request.args.get('columnaid')
    c = controlador.consult_columna(columnaid)
    controlador.delete_columna(columnaid)
    tablaid = c.get('tablaid')
    return redirect(url_for('tabla',tablaid = tablaid))


@app.route('/delete_fila') 
def delete_fila():
    id = request.args.get('filaid')
    c = controlador.consult_fila(id)
    controlador.delete_fila(id)
    tablaid = c.get('tablaid')
    return redirect(url_for('tabla',tablaid = tablaid))


@app.route('/reorder_columna_tabla') 
def reorder_columna_tabla():
    modo = request.args.get('modo')
    columnaid = request.args.get('columnaid')
    c = controlador.consult_columna(columnaid)
    tablaid = c.get('tablaid')
    if modo == 'm':
        controlador.down_orden_columna(columnaid)
    elif modo == 'M':
        controlador.up_orden_columna(columnaid)
    return redirect(url_for('tabla',tablaid = tablaid))


@app.route('/update_orden_columna') 
def update_orden_columna():
    modo = request.args.get('modo')
    columnaid = request.args.get('columnaid')
    c = controlador.consult_columna(columnaid)
    tablaid = c.get('tablaid')
    if modo == 'm':
        controlador.down_orden_columna(columnaid)
    elif modo == 'M':
        controlador.up_orden_columna(columnaid)
    return redirect(url_for('tabla',tablaid = tablaid))


@app.route('/change_orden_fila')
def change_orden_fila():
    modo = request.args.get('modo')
    filaid = request.args.get('filaid')
    c = controlador.consult_fila(filaid)
    tablaid = c.get('tablaid')
    controlador.change_orden_fila(filaid, modo)
    return redirect(url_for('tabla',tablaid = tablaid))



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

    return redirect(url_for('tabla'))


@app.route('/update_row', methods=['POST'])
def update_row():
    args_page = request.args.get('page')
    page = args_page if args_page else 'index'

    f = controlador.update_tarea_tabla
    valores = utils.request_values_parameters(f)
    f(*valores)

    return redirect(url_for(page))


@app.route('/api_bd_update', methods=['POST'])
def api_bd_update():
    try:
        data = request.get_json()

        tabla =    data.get("tabla")
        columnas = data.get("columnas")
        valores =  data.get('valores')
        where =    data.get('where')
        where_v =  data.get('where_v')

        bd.bd_update(tabla, columnas, valores, where, where_v)
        rpta = f''' Tabla: {tabla} , Columnas: {columnas} , Valores: {valores} , where: {where} , where_v: {where_v} '''

        return jsonify({'respuesta': rpta})
    except Exception as e:
        return jsonify({"error": str(e)}), 500


@app.route('/api_check_tarea', methods=['POST'])
def api_check_tarea():
    try:
        data = request.get_json()
        id =    data.get("id")
        controlador.check_tarea( id )
        estado = controlador.get_tarea_id(id).get('completo',0)
        rpta = f''' TAREA ID {id} '''
        return jsonify({'respuesta': rpta , 'estado' : estado})
    
    except Exception as e:
        return jsonify({"error": str(e)}), 500


@app.route('/api_nueva_tabla_tarea', methods=['POST'])
@validar_usuario()
def api_nueva_tabla_tarea():
    try:
        data =      request.get_json()
        filaid =    data.get('filaid')
        columnaid = data.get('columnaid') 
        tid = controlador.register_tabla_tarea( filaid , columnaid )
        rpta = f''' FIL ID {filaid} , COL ID {columnaid} , TAR ID {tid} '''
        tarea = controlador.get_tarea_id(tid)
        return jsonify({'respuesta': rpta , 'tarea' : tarea })

    except Exception as e:
        return jsonify({"error": str(e)}), 500


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


@app.route('/guardar_detalle_matricula', methods=['POST'])
def guardar_detalle_matricula():
    matriculaid = request.form['matriculaid']
    controlador.delete_detalle_matricula_matriculaid(matriculaid)
    rf = request.form
    for f in rf:
        if f.startswith('curso_'):
            grupoid = rf.get(f)
            controlador.insert_detalle_matricula(matriculaid, grupoid)
    return redirect(url_for('matricula', id=matriculaid))


@app.route('/guardar_paleta', methods=['POST'])
def guardar_paleta():
    f = controlador.insert_paleta
    valores = utils.request_values_parameters(f)
    id = f( *valores )
    controlador.change_estado_paleta(id)
    return redirect(url_for('configuracion'))


@app.route('/guardar_actividad', methods=['POST'])
def guardar_actividad():
    f = controlador.insert_actividad
    valores = utils.request_values_parameters(f)
    f( *valores )
    return redirect(url_for('calendario'))


@app.route('/execute_post=<name>', methods=['POST'])
def execute_post(name):
    crud_dict = values.CRUD_FORMS.get(name)
    f = crud_dict.get('function')
    re = crud_dict.get('return')
    valores = utils.request_values_parameters(f)
    f( *valores )
    return re



# API para actualizar orden de columnas
@app.route('/api_update_columnas_orden', methods=['POST'])
def api_update_columnas_orden():
    try:
        data = request.get_json()
        columnas_orden = data['columnas_orden']  # Lista de IDs en el nuevo orden
        
        # Actualizar orden de cada columna
        for i, columna_id in enumerate(columnas_orden):
            bd.sql_execute(
                "UPDATE columna SET orden = %s WHERE id = %s",
                (i + 1, columna_id)
            )
        
        # connection.commit()
        return jsonify({"success": True})
        
    except Exception as e:
        print(f"Error: {e}")
        return jsonify({"success": False, "error": str(e)}), 500


# API para actualizar orden de filas
@app.route('/api_update_filas_orden', methods=['POST'])
def api_update_filas_orden():
    try:
        data = request.get_json()
        filas_orden = data['filas_orden']  # Lista de IDs en el nuevo orden
        
        # Actualizar orden de cada fila
        for i, fila_id in enumerate(filas_orden):
            bd.sql_execute(
                "UPDATE fila SET orden = %s WHERE id = %s",
                (i + 1, fila_id)
            )
        
        # connection.commit()
        return jsonify({"success": True})
        
    except Exception as e:
        print(f"Error: {e}")
        return jsonify({"success": False, "error": str(e)}), 500









@app.route("/calendario")
# @validar_usuario()
def calendario():
    local_datetime = utils.local_time()
    local_hour = int(local_datetime.strftime('%H'))

    progreso = controlador.get_progreso_ciclo()
    dias = progreso.get('total') - progreso.get('actual')

    conf = controlador.get_configuracion()
    modo_simple = conf.get('modo_simple')
    ver_dias = conf.get('ver_dias')
    cdias = conf.get('dias')
    DAYS = dias if ver_dias else cdias
    HRS =  conf.get('hrs')
    MINS = conf.get('mins')
    DIFF = conf.get('diff')
    DIFH = conf.get('difh')

    columnas = [
        [
            (local_datetime + timedelta(days=i - DIFF)),
            (local_datetime + timedelta(days=i - DIFF)).isoweekday() % 7
        ]
        for i in range(DAYS)
    ]

    filas2 = [
        [i, j]
        for i in range(HRS)
        for j in range(MINS)
    ]

    filas = [
        [ (i + local_hour - DIFH) % 24 , '00']
        for i in range(HRS )
        # for j in range(MINS)
    ]

    grupos = controlador.get_grupos_matriculaid(2)
    contextos = controlador.get_contextos()
    actividades = controlador.get_actividades_items()
    tipo_actividades = controlador.get_tipos_actividades()

    return render_template(
        "calendario.html",
        modo_simple = modo_simple ,
        local_datetime = local_datetime ,
        columnas = columnas ,
        filas = filas ,
        actividades = actividades ,
        contextos = contextos ,
        grupos = grupos ,
        tipo_actividades = tipo_actividades ,
        DAYS = DAYS ,
        DIFF = DIFF ,
        DIFH = DIFH ,
    )



@app.template_filter("add_days")
def add_days(value, days):
    fmt = "%Y-%m-%d"
    dt = datetime.strptime(value, fmt)
    return (dt + timedelta(days=days)).strftime(fmt)
