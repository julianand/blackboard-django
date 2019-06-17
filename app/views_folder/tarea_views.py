from django.shortcuts import render
from django.http import HttpResponse, FileResponse
from django.views.decorators.http import require_http_methods
from django.contrib.auth.decorators import login_required

from .decorators import require_roles, tarea_test
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
			'id': tarea.id,
			'nombre': tarea.nombre,
			'descripcion': tarea.descripcion,
			'fecha_inicio': tarea.fecha_inicio.isoformat(),
			'fecha_final': tarea.fecha_final.isoformat()
		}

		return HttpResponse(json.dumps(res))

	return render(request, 'profesor/tarea.html')