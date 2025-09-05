from datetime import datetime, date , timedelta 
import hashlib
import base64
import pytz
import inspect
from flask import Flask, render_template, request, redirect, flash, jsonify, session, make_response,  redirect, url_for
import controlador
from colour import Color


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


def local_datetime_bd(days_delta=0):
    fecha = local_time() + timedelta(days=days_delta)
    return format_datetime_bd(fecha)


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


