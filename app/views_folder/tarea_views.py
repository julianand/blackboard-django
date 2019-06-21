from django.shortcuts import render
from django.http import HttpResponse, FileResponse
from django.views.decorators.http import require_http_methods
from django.contrib.auth.decorators import login_required

from .decorators import require_roles, tarea_test
from app.forms import GuardarTareaForm
from app.models import Tarea

import json

@require_http_methods(['GET'])
@login_required
@require_roles(['PROFESOR'])
@tarea_test
def verAdjunto (request, num, tarea_id):
	tar = Tarea.objects.get(pk=tarea_id)

	try:
		return FileResponse(tar.file, as_attachment=True)
	except Exception as e:
		response = HttpResponse('El archivo no se encuentra')
		response.status_code = 500
		return response

@require_http_methods(['GET', 'POST'])
@login_required
@require_roles(['PROFESOR'])
@tarea_test
def index (request, num, tarea_id):
	if request.method == 'POST':
		tarea = Tarea.objects.get(pk=tarea_id)
		res = {
			'nombre': tarea.nombre,
			'descripcion': tarea.descripcion,
			'fecha_inicio': tarea.fecha_inicio.isoformat(),
			'fecha_final': tarea.fecha_final.isoformat(),
			'file_name': tarea.file.name.split('/')[-1]
		}

		return HttpResponse(json.dumps(res))

	return render(request, 'profesor/tarea.html')

@require_http_methods([ 'POST' ])
@login_required
@require_roles(['PROFESOR'])
@tarea_test
def guardar (request, num, tarea_id):
	form = GuardarTareaForm(request.POST, request.FILES)

	if form.is_valid():
		tarea = Tarea.objects.get(pk=tarea_id)
		tarea.nombre = request.POST['nombre']
		tarea.descripcion = request.POST['descripcion']
		tarea.fecha_final = request.POST['fecha_final']

		if 'file' in request.FILES:
			tarea.file.delete()
			tarea.file = request.FILES['file']

		tarea.save()

		return HttpResponse('Tarea actualizada correctamente')

	response = HttpResponse(form.errors.as_json())
	response.status_code = 422
	return response