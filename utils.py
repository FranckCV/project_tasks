from datetime import datetime, date , timedelta 
import hashlib
import base64
import pytz
import inspect
from flask import Flask, render_template, request, redirect, flash, jsonify, session, make_response,  redirect, url_for


ENLACES_MENU= [
    'horario' ,
    # 'grupos' , 
    # 'cursos' , 
    # 'docentes' , 

    # 'index' ,
    # 'horario' ,
    # 'tareas' ,
    # 'tablas' ,
    # 'notas' ,
    # 'cursos' , 
    # 'docentes' , 
    # 'test' ,

    # 'horario' ,
    # 'tareas' ,
    # 'sinfecha' ,
    # 'info_notas' ,
]

WORKSPACE_ITEMS = [
    'arbol' ,
    'tabla' ,
    'tablero' ,

]

COLOR_DEFAULT = '#fff'

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


CURSOS_AMARILLO = (5 , 8 , 14 , 20 , 25 , 36 , 43 , 51 , 57 ,63)
CURSOS_AZUL = (2 , 16 , 21 , 28 , 31, 32 , 41 , 49 , 55 , 61)
CURSOS_MORADO = (4, 9 , 11 , 18 , 26 , 35 , 44 , 48 , 53)
CURSOS_VERDE = (1 , 7 , 12 , 22 , 23 , 29 , 45 , 47 , 65)
CURSOS_ROJO = (6 , 27 , 30 , 33 , 40 , 46 , 52 , 62)
CURSOS_NARANJA = (3, 10 , 15 , 17 , 24 , 34 , 39 , 50 , 56 , 60)
CURSOS_CELESTE = (13 , 19 , 37 , 42 , 54 , 58 , 59 , 64)
CURSOS_GRIS = (38)




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










