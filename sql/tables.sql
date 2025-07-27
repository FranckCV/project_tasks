CREATE TABLE actividad (
  id          int(11) NOT NULL AUTO_INCREMENT, 
  nombre      varchar(150), 
  siglas      varchar(5), 
  descripcion text, 
  color       varchar(20), 
  icono       text, 
  img         text, 
  PRIMARY KEY (id));
CREATE TABLE color (
  id     int(11) NOT NULL AUTO_INCREMENT, 
  nombre varchar(20) NOT NULL, 
  valor  varchar(20) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE curso (
  id          int(11) NOT NULL AUTO_INCREMENT, 
  nombre      text NOT NULL, 
  siglas      varchar(5), 
  descripcion text, 
  creditos    int(11) NOT NULL, 
  ciclo       int(11) NOT NULL, 
  icono       text NOT NULL, 
  colorid     int(11) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE detalle_matricula (
  matriculaid int(11) NOT NULL, 
  grupoid     int(11) NOT NULL, 
  PRIMARY KEY (matriculaid, 
  grupoid));
CREATE TABLE docente (
  id        int(11) NOT NULL AUTO_INCREMENT, 
  nombres   varchar(255) NOT NULL, 
  apellidos varchar(255) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE grupo (
  id             int(11) NOT NULL AUTO_INCREMENT, 
  nombre         varchar(250) NOT NULL, 
  docenteid      int(11) NOT NULL, 
  semestrecodigo int(11) NOT NULL, 
  cursoid        int(11) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE horario (
  id          int(11) NOT NULL AUTO_INCREMENT, 
  titulo      text, 
  descripcion text, 
  dia         int(11), 
  h_ini       int(11), 
  min_ini     int(11), 
  h_fin       int(11), 
  min_fin     int(11), 
  fecha_ini   date, 
  fecha_fin   date, 
  contextoid  int(11), 
  grupoid     int(11), 
  PRIMARY KEY (id));
CREATE TABLE matricula (
  id             int(11) NOT NULL AUTO_INCREMENT, 
  nombre         text NOT NULL, 
  estado         tinyint(1), 
  seleccionado   tinyint(1) NOT NULL, 
  fecha          timestamp NOT NULL, 
  semestrecodigo int(11) NOT NULL, 
  usuarioid      int(11) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE nota (
  id         int(11) NOT NULL AUTO_INCREMENT, 
  nombre     text, 
  porcentaje numeric(5, 2) NOT NULL, 
  valor      numeric(5, 2), 
  unidadid   int(11) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE prerrequisito (
  cursoid     int(11) NOT NULL, 
  cursoid_pre int(11) NOT NULL, 
  PRIMARY KEY (cursoid, 
  cursoid_pre));
CREATE TABLE semestre (
  codigo   int(11) NOT NULL AUTO_INCREMENT, 
  f_inicio timestamp NOT NULL, 
  f_fin    timestamp NOT NULL, 
  activo   tinyint(1) NOT NULL, 
  PRIMARY KEY (codigo));
CREATE TABLE unidad (
  id         int(11) NOT NULL AUTO_INCREMENT, 
  nombre     text, 
  porcentaje numeric(5, 2) NOT NULL, 
  grupoid    int(11) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE usuario (
  id       int(11) NOT NULL AUTO_INCREMENT, 
  nombre   varchar(250) NOT NULL, 
  username varchar(250) NOT NULL, 
  password varchar(250) NOT NULL, 
  PRIMARY KEY (id));
ALTER TABLE curso ADD CONSTRAINT FKcurso421515 FOREIGN KEY (colorid) REFERENCES color (id);
ALTER TABLE horario ADD CONSTRAINT FKhorario682240 FOREIGN KEY (grupoid) REFERENCES grupo (id);
ALTER TABLE detalle_matricula ADD CONSTRAINT FKdetalle_ma614462 FOREIGN KEY (grupoid) REFERENCES grupo (id);
ALTER TABLE detalle_matricula ADD CONSTRAINT FKdetalle_ma708364 FOREIGN KEY (matriculaid) REFERENCES matricula (id);
ALTER TABLE matricula ADD CONSTRAINT FKmatricula214145 FOREIGN KEY (usuarioid) REFERENCES usuario (id);
ALTER TABLE matricula ADD CONSTRAINT FKmatricula699956 FOREIGN KEY (semestrecodigo) REFERENCES semestre (codigo);
ALTER TABLE unidad ADD CONSTRAINT FKunidad83868 FOREIGN KEY (grupoid) REFERENCES grupo (id);
ALTER TABLE grupo ADD CONSTRAINT FKgrupo646143 FOREIGN KEY (cursoid) REFERENCES curso (id);
ALTER TABLE grupo ADD CONSTRAINT FKgrupo65739 FOREIGN KEY (semestrecodigo) REFERENCES semestre (codigo);
ALTER TABLE grupo ADD CONSTRAINT FKgrupo55510 FOREIGN KEY (docenteid) REFERENCES docente (id);
ALTER TABLE prerrequisito ADD CONSTRAINT FKprerrequis207825 FOREIGN KEY (cursoid_pre) REFERENCES curso (id);
ALTER TABLE prerrequisito ADD CONSTRAINT FKprerrequis374739 FOREIGN KEY (cursoid) REFERENCES curso (id);
ALTER TABLE nota ADD CONSTRAINT FKnota214246 FOREIGN KEY (unidadid) REFERENCES unidad (id);
ALTER TABLE horario ADD CONSTRAINT FKhorario645468 FOREIGN KEY (contextoid) REFERENCES actividad (id);
