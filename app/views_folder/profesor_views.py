from django.shortcuts import render
from django.http import HttpResponse
from django.views.decorators.http import require_http_methods
from django.contrib.auth.decorators import login_required

from .decorators import require_roles
from app.forms import RegistroCursoForm
from app.models import Curso

import json, datetime

@require_http_methods(['GET'])
@login_required
@require_roles(['PROFESOR'])
def index (request):
	return render(request, 'profesor/index.html')

@require_http_methods(['GET'])
@login_required
@require_roles(['PROFESOR'])
def cursos (request):
	res = request.user.persona.curso_set.all();
	res = [ { 'id': curso.id, 'nombre': curso.nombre, 'descripcion': curso.descripcion, 'n_estudiantes': len(curso.estudiantes.all()) } for curso in res ];
	return HttpResponse(json.dumps(res))

@require_http_methods(['POST'])
@login_required
@require_roles(['PROFESOR'])
def registrarCurso (request):
	datos = json.loads(request.body)
	form = RegistroCursoForm(datos)

	if form.is_valid():
		crs = Curso()
		crs.nombre = datos['nombre']
		crs.descripcion = datos['descripcion']
		crs.fecha_final = datos['fecha_final']
		crs.fecha_inicio = datetime.datetime.now()
		crs.profesor_id = request.user.id
		crs.save()
		return HttpResponse('ok')

	response = HttpResponse(form.errors.as_json())
	response.status_code = 422
	return response