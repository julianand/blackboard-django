from django.shortcuts import render
from django.http import HttpResponse, FileResponse
from django.views.decorators.http import require_http_methods
from django.contrib.auth.decorators import login_required

from .decorators import require_roles, curso_test
from app.forms import RegistroCursoForm, NombreCursoForm, FechaCursoForm, DescripcionCursoForm, TareaForm
from app.models import Curso, Tarea

import json, datetime

@require_http_methods(['GET'])
@login_required
@require_roles(['PROFESOR'])
@curso_test
def index (request, num):
	return render(request, 'profesor/curso.html')

@require_http_methods(['GET'])
@login_required
@require_roles(['PROFESOR'])
@curso_test
def datosCurso (request, num):
	curso = Curso.objects.get(pk=num)
	res = {
		'nombre': curso.nombre,
		'descripcion': curso.descripcion,
		'fecha_inicio': curso.fecha_inicio.isoformat(),
		'fecha_final': curso.fecha_final.isoformat(),
		'estudiantes': [ { 'id': est.id, 'nombres': est.nombres, 'apellidos': est.apellidos } for est in curso.estudiantes.all() ],
		'tareas': [ {
			'id': tar.id,
			'nombre': tar.nombre,
			'descripcion': tar.descripcion,
			'fecha_final': str(tar.fecha_final),
			'fecha_inicio': str(tar.fecha_inicio)
		} for tar in curso.tarea_set.all() ]
	}

	return HttpResponse(json.dumps(res))

@require_http_methods(['POST'])
@login_required
@require_roles(['PROFESOR'])
@curso_test
def cambiarNombre (request, num):
	datos = json.loads(request.body)
	form = NombreCursoForm(datos)

	if form.is_valid():
		curso = Curso.objects.get(pk=num)
		curso.nombre = datos['nombre']
		curso.save();

		return HttpResponse('')

	response = HttpResponse(form.errors.as_json())
	response.status_code = 422
	return response

@require_http_methods(['POST'])
@login_required
@require_roles(['PROFESOR'])
@curso_test
def cambiarFecha (request, num, keyword):
	datos = json.loads(request.body)
	form = FechaCursoForm(datos)

	if form.is_valid():
		curso = Curso.objects.get(id=num)
		if keyword == 'inicio':
			curso.fecha_inicio = datos['fecha']
		else:
			curso.fecha_final = datos['fecha']
		curso.save()

		return HttpResponse('')

	response = HttpResponse(form.errors.as_json())
	response.status_code = 422
	return response

@require_http_methods(['POST'])
@login_required
@require_roles(['PROFESOR'])
@curso_test
def cambiarDescripcion (request, num):
	datos = json.loads(request.body)
	form = DescripcionCursoForm(datos)

	if form.is_valid():
		curso = Curso.objects.get(id=num)
		curso.descripcion = datos['descripcion']
		curso.save()

		return HttpResponse('')

	response = HttpResponse(form.errors.as_json())
	response.status_code = 422
	return response

@require_http_methods(['POST'])
@login_required
@require_roles(['PROFESOR'])
@curso_test
def guardarTarea (request, num):
	form = TareaForm(request.POST, request.FILES)

	if form.is_valid():
		if request.POST['fecha_final'] < str(datetime.datetime.now().date()):
			form.add_error('fecha_final', 'La fecha final debe ser mayor a hoy')
		else:
			tarea = Tarea()
			tarea.nombre = request.POST['nombre']
			tarea.descripcion = request.POST['descripcion']
			tarea.fecha_inicio = datetime.datetime.now()
			tarea.fecha_final = request.POST['fecha_final']
			tarea.file = request.FILES['file']
			tarea.curso_id = num
			tarea.save()

			return HttpResponse('')

	response = HttpResponse(form.errors.as_json())
	response.status_code = 422
	return response
