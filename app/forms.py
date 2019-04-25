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
	fecha_final = forms.DateField()