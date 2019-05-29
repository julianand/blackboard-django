from django.shortcuts import render
from django.http import HttpResponse
from django.views.decorators.http import require_http_methods
from django.contrib.auth.decorators import login_required

from .decorators import require_roles, tarea_test

@require_http_methods(['POST'])
@login_required
@require_roles(['PROFESOR'])
@tarea_test
def verAdjunto (request, num, tarea_id):
	tar = Tarea.objects.get(pk=tarea_id)

	return HttpResponse('')