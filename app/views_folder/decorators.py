from functools import wraps
from django.http import HttpResponse
from django.shortcuts import redirect

from app.models import Curso, Tarea

def require_roles (roles):
	def decorator (function):
		@wraps(function)
		def wrap (request, *args, **kwargs):
			if request.user.rol.nombre not in roles:
				return redirect('/')

			return function(request, *args, **kwargs)
		return wrap
	return decorator

def curso_test (function):
	@wraps(function)
	def wrap (request, *args, **kwargs):
		curso = Curso.objects.get(pk=kwargs['num'])
		cursos = request.user.persona.curso_set.all()

		if curso not in cursos:
			response = HttpResponse('')
			response.status_code = 403
			return response

		return function(request, *args, **kwargs)
	return wrap

def tarea_test (function):
	@wraps(function)
	def wrap (request, *args, **kwargs):
		cursos = request.user.persona.curso_set.all()
		curso = Curso.objects.get(pk=kwargs['num'])
		tarea = Tarea.objects.get(pk=kwargs['tarea_id'])

		if curso in cursos and tarea in curso.tarea_set.all():
			return function(request, *args, **kwargs)

		response = HttpResponse('')
		response.status_code = 403
		return response
	return wrap