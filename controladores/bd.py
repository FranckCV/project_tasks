import pymysql



def obtener_conexion():
    return pymysql.connect(host='localhost',
                                port=3306,
                                user='root',
                                password='',
                                db='bd_proyecto'
                                )




# def obtener_conexion():
#     return pymysql.connect(host='FranckCv.mysql.pythonanywhere-services.com',
#                                 user='FranckCv',
#                                 password='mysql2025',
#                                 db='FranckCv$bd_proyecto')


