from datetime import datetime, date , timedelta 
import hashlib
import base64
import pytz
import inspect
from flask import Flask, render_template, request, redirect, flash, jsonify, session, make_response,  redirect, url_for
import controlador
from colour import Color

HABILITAR_LOGIN = False

USUARIO = {
    'id' : 1 ,
    'username' : '123456' , 
    'password' : '123456' ,
}


ERRORES = {
    "NO_EXISTE_USERNAME" : "El nombre de usuario ingresado ya fue tomado por otro usuario" ,
    "NO_EXISTE_EMAIL" : "El correo electronico ingresado ya fue tomado por otro usuario" ,
    "LOGIN_INVALIDO" : 'Credenciales inválidas. Intente de nuevo' ,
    "PAGINA_NO_EXISTE" : 'La página a la que intentó ingresar no existe' ,
    "'NoneType' object is not subscriptable" : "Inicie sesión con su cuenta correspondiente",
    "foreign key constraint fails" : 'No es posible eliminar dicha fila' ,
    "404 Not Found: The requested URL was not found on the server. If you entered the URL manually please check your spelling and try again." : "El enlace al que intentó ingresar no existe." ,
}


ENLACES_MENU= [
    {'nombre' : 'Perfil' ,        'icono': 'fa-solid fa-circle-xmark' ,     'enlace': 'test' ,          'color': '' } ,
    {'nombre' : 'Configuracion' , 'icono': 'fa-solid fa-gear' ,             'enlace': 'configuracion' , 'color': '' } , 
    {'nombre' : 'Dashboard' ,     'icono': 'ri-dashboard-fill' ,            'enlace': 'index' ,         'color': '' } ,
    {'nombre' : 'Notas' ,         'icono': 'fa-solid fa-graduation-cap' ,   'enlace': 'notas' ,         'color': '' } ,
    {'nombre' : 'Tablas' ,        'icono': 'ri-table-line' ,                'enlace': 'tablas' ,        'color': '' } ,
    {'nombre' : 'Tareas' ,        'icono': 'fa-solid fa-bars-staggered' ,   'enlace': 'tareas' ,        'color': '' } ,
    {'nombre' : 'Horario' ,       'icono': 'fa-solid fa-clock' ,            'enlace': 'horario' ,       'color': '' } ,
    {'nombre' : 'Calendario' ,    'icono': 'fa-solid fa-circle-xmark' ,     'enlace': 'calendario' ,    'color': '' } ,
    {'nombre' : 'Matriculas' ,    'icono': 'fa-solid fa-grip' ,             'enlace': 'matriculas',     'color': '' } ,
    {'nombre' : 'Grupos' ,        'icono': 'fa-solid fa-list' ,             'enlace': 'grupos' ,        'color': '' } ,
    
    {'nombre' : 'Test' , 'icono': 'fa-solid fa-code' , 'enlace': 'test' , 'color': '' } ,
    {'nombre' : 'Info' , 'icono': 'fa-solid fa-circle-info' , 'enlace': 'info' , 'color': '' } ,

    # {'nombre' : 'Semestres' , 'icono': 'fa-solid fa-calendar-days' , 'enlace': 'semestres' , 'color': '' } ,
    # {'nombre' : 'Cursos' , 'icono': 'fa-solid fa-layer-group' , 'enlace': 'cursos' , 'color': '' } ,
    # {'nombre' : 'Unidades' , 'icono': 'fa-solid fa-clock' , 'enlace': 'unidades' , 'color': '' } ,
    
]

WORKSPACE_ITEMS = [
    'arbol' ,
    'tabla' ,
    'tablero' ,
]

aCRUD_FORMS = {
    1 : {
        'function': 'm' , 
        'form_fields': [ {
            'name': 'id',
            'label': 'ID',
            'placeholder': 'ID',      
            'type': 'text',  
            'required': True ,    
            'able': False , 
            'datos': None ,
            'validacion': '' ,
        } ,
        { 

        } ,
        ] ,
    } ,
}

MATRICULA_ESTADO = [
    { 'value' : 1 , 'name' : '' } ,
]




COLOR_DEFAULT = "#b5b5b5"

BASE_NOMBRE_DIAS = ('DOMINGO','LUNES','MARTES','MIERCOLES','JUEVES','VIERNES','SABADO')
TOTAL_DAYS = 7
DIF_DAYS = 0
DIF_HOURS = 0
CANTCOLSAD = 3
CANTROWSAD = 2

HOUR_INI = 5
MIN_INI = 5

CICLO_ACTUAL = 7

sizeCOL   = '150px'
sizeCOLad = '20px'
sizeROW   = '30px'
sizeROWad = '20px'
sizeGAP   = '1px'

SEMESTRE = '2025-2'
USUARIOID = 1

CURSOS_AMARILLO = (5 , 8 , 14 , 20 , 25 , 36 , 43 , 51 , 57 ,63)
CURSOS_AZUL = (2 , 16 , 21 , 28 , 31, 32 , 41 , 49 , 55 , 61)
CURSOS_MORADO = (4, 9 , 11 , 18 , 26 , 35 , 44 , 48 , 53)
CURSOS_VERDE = (1 , 7 , 12 , 22 , 23 , 29 , 45 , 47 , 65)
CURSOS_ROJO = (6 , 27 , 30 , 33 , 40 , 46 , 52 , 62)
CURSOS_NARANJA = (3, 10 , 15 , 17 , 24 , 34 , 39 , 50 , 56 , 60)
CURSOS_CELESTE = (13 , 19 , 37 , 42 , 54 , 58 , 59 , 64)
CURSOS_GRIS = (38)


def mix_colors(c1, c2, ratio=0.5):
    color1 = Color(c1)
    color2 = Color(c2)
    r = (1 - ratio) * color1.red   + ratio * color2.red
    g = (1 - ratio) * color1.green + ratio * color2.green
    b = (1 - ratio) * color1.blue  + ratio * color2.blue
    return Color(rgb=(r, g, b))


def encrypt_sha256_string(str):
    h = hashlib.new('sha256')
    h.update(bytes(str, encoding='utf-8'))
    encstr = h.hexdigest()
    return encstr


def local_time():
    return datetime.now(pytz.utc).astimezone(pytz.timezone('America/Lima'))


def format_time(time,format):
    return time.strftime(format)


def format_now(format):
    date = local_time()
    return date.strftime(format)


def format_date_bd(date):
    return date.strftime("%Y-%m-%d")


def format_datetime_bd(date):
    return date.strftime("%Y-%m-%d %H:%M:%S")


def request_values_parameters(f):
    firma = inspect.signature(f)
    valores = []
    for nombre, parametro in firma.parameters.items():
        valor = request.form.get(nombre) 
        valores.append(valor)
    return valores










