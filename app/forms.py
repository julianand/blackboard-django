from django import forms

from .models import Rol

class RegistroForm (forms.Form):
	nombres = forms.CharField()
	apellidos = forms.CharField()
	correo = forms.EmailField()
	usuario = forms.CharField()
	password = forms.CharField()
	rol_id = forms.ModelChoiceField(queryset=Rol.objects.all())

class LoginForm (forms.Form):
	usuario = forms.CharField()
	password = forms.CharField()

class RegistroCursoForm (forms.Form):
	nombre = forms.CharField()
	descripcion = forms.CharField()
	fecha_final = forms.DateField()

class NombreCursoForm (forms.Form):
	nombre = forms.CharField()

class FechaCursoForm (forms.Form):
	fecha = forms.DateField()

class DescripcionCursoForm (forms.Form):
	descripcion = forms.CharField()

class TareaForm (forms.Form):
	nombre = forms.CharField()
	descripcion = forms.CharField()
	fecha_final = forms.DateField()
	file = forms.FileField()

class GuardarTareaForm (forms.Form):
	nombre = forms.CharField()
	descripcion = forms.CharField()
	fecha_final = forms.DateField()
	file = forms.FileField(required=False)