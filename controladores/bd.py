import pymysql

SQLALCHEMY_DATABASE_URI = 'mysql://ulkkuhuq5vq6ly5k:k1huLwTpahIIbyRds33S@b1maiitpask5s6u7x1or-mysql.services.clever-cloud.com:3306/b1maiitpask5s6u7x1or'


def obtener_conexion():
    return pymysql.connect(
        host='b1maiitpask5s6u7x1or-mysql.services.clever-cloud.com',
        port=3306,
        user='ulkkuhuq5vq6ly5k',
        password='k1huLwTpahIIbyRds33S',
        db='b1maiitpask5s6u7x1or'
        )



# def obtener_conexion():
#     return pymysql.connect(host='localhost',
#                                 port=3306,
#                                 user='root',
#                                 password='',
#                                 db='bd_proyecto'
#                                 )




# def obtener_conexion():
#     return pymysql.connect(host='FranckCv.mysql.pythonanywhere-services.com',
#                                 user='FranckCv',
#                                 password='mysql2025',
#                                 db='FranckCv$bd_proyecto')


