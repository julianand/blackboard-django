from django.shortcuts import render
from django.http import HttpResponse
from django.views.decorators.http import require_http_methods
from django.contrib.auth.decorators import login_required

from .decorators import require_roles
from app.models import Curso

import json

@login_required
@require_http_methods([ 'GET' ])
@require_roles([ 'ESTUDIANTE' ])
def index (request):
	return render(request, 'estudiante/index.html')

@login_required
@require_http_methods([ 'GET' ])
@require_roles([ 'ESTUDIANTE' ])
def cursos (request):
	res = [
		{
			'id': curso.id,
			'nombre': curso.nombre,
			'descripcion': curso.descripcion,
			'fecha_inicio': curso.fecha_inicio.isoformat(),
			'fecha_final': curso.fecha_final.isoformat(),
			'profesor': '%s %s' % (curso.profesor.nombres, curso.profesor.apellidos)
		} for curso in Curso.objects.all()
	]

	return HttpResponse(json.dumps(res))

@login_required
@require_http_methods([ 'GET' ])
@require_roles([ 'ESTUDIANTE' ])
def matricular (request):
	return HttpResponse('hola');