from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.views.decorators.http import require_http_methods

from app.forms import RegistroCursoForm

import json

@require_http_methods(['GET'])
# @login_required
def index (request):
	return render(request, 'profesor/index.html')

@require_http_methods(['POST'])
def registrarCurso (request):
	datos = json.loads(request.body)
	form = RegistroCursoForm(datos)

	if form.is_valid():

		return HttpResponse(':)')

	response = HttpResponse(form.errors.as_json())
	response.status_code = 422
	return response