# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=80)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class Curso(models.Model):
    nombre = models.CharField(max_length=200)
    descripcion = models.CharField(max_length=200)
    fecha_inicio = models.DateField()
    fecha_final = models.DateField()
    profesor = models.ForeignKey('Persona', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'curso'


class CursoEstudiante(models.Model):
    curso = models.ForeignKey(Curso, models.DO_NOTHING, primary_key=True)
    estudiante = models.ForeignKey('Persona', models.DO_NOTHING)
    nota = models.CharField(max_length=10, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'curso_estudiante'
        unique_together = (('curso', 'estudiante'),)


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey('Usuario', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Persona(models.Model):
    nombres = models.CharField(max_length=100)
    apellidos = models.CharField(max_length=100)
    correo = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'persona'


class Rol(models.Model):
    nombre = models.CharField(max_length=100)
    root = models.CharField(max_length=20)

    class Meta:
        managed = False
        db_table = 'rol'


class Tarea(models.Model):
    nombre = models.CharField(max_length=200)
    descripcion = models.CharField(max_length=500)
    fecha_inicio = models.DateField()
    fecha_final = models.DateField()
    file = models.CharField(max_length=200)
    curso = models.ForeignKey(Curso, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'tarea'


class Usuario(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    nombre = models.CharField(unique=True, max_length=255)
    updated = models.DateTimeField()
    created = models.DateTimeField()
    persona = models.ForeignKey(Persona, models.DO_NOTHING)
    rol = models.ForeignKey(Rol, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'usuario'
