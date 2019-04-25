from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.views.decorators.http import require_http_methods
from django.contrib.auth import authenticate, login, logout
from .models import Rol, Persona, Usuario
from .forms import RegistroForm, LoginForm

from django.core import serializers

import json

# Create your views here.
@require_http_methods(['GET'])
def index (request):
	if request.user.is_authenticated:
		return HttpResponseRedirect(request.user.rol.root)

	return render(request, 'home/index.html', {})

@require_http_methods(['GET'])
def logout_view (request):
	logout(request)
	return HttpResponseRedirect('/')

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

		return HttpResponse(0)

	response = HttpResponse(form.errors.as_json())
	response.status_code = 422
	return response

@require_http_methods(['POST'])
def login_view (request):
	datos = json.loads(request.body)
	form = LoginForm(datos)

	if form.is_valid():
		user = authenticate(request, username=datos['usuario'], password=datos['password'])
		if (user is not None):
			login(request, user)
			return HttpResponse('')
		else:
			response = HttpResponse('No se reconoce usuario o contraseña')
			response.status_code = 400
			return response

	response = HttpResponse(form.errors.as_json())
	response.status_code = 422
	return response