from django.shortcuts import render
from django.http import HttpResponse
from django.views.decorators.http import require_http_methods
from django.contrib.auth import authenticate

from .models import Rol, Persona, Usuario
from .forms import RegistroForm, LoginForm

from django.core import serializers

import json

# Create your views here.
@require_http_methods(['GET'])
def index (request):
	return render(request, 'home/index.html', {})

@require_http_methods(['GET'])
def datosRegistro (request):
	roles = [ { 'id': rol.id, 'nombre': rol.nombre } for rol in  Rol.objects.all() ]
	return HttpResponse(json.dumps({ 'roles': roles }))

@require_http_methods(['POST'])
def registrar (request):
	datos = json.loads(request.body)
	form = RegistroForm(datos)

	if form.is_valid():
		per = Persona()
		per.nombres = datos['nombres']
		per.apellidos = datos['apellidos']
		per.correo = datos['correo']
		per.save()

		Usuario.objects.create_user(datos['usuario'], datos['password'], datos['rol_id'], per.id)

		return HttpResponse(1)

	return HttpResponse(form.errors.as_json())

@require_http_methods(['POST'])
def login (request):
	datos = json.loads(request.body)
	form = LoginForm(datos)

	if (form.is_valid()):
		user = authenticate(username=datos['usuario'], password=datos['password'])
		if (user is not None):
			return HttpResponse('logueado')
		else:
			return HttpResponse('hola')

	return HttpResponse(forms.errors.as_json())