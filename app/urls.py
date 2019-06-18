from django.urls import path, include

from . import views
from .views_folder import profesor_views, curso_views, tarea_views

tarea_patterns = [
    path('', tarea_views.index),
    path('ver-adjunto', tarea_views.verAdjunto),
    path('guardar', tarea_views.guardar)
]

curso_patterns = [
    path('', curso_views.index),
    path('datos-curso/', curso_views.datosCurso),
    path('cambiar-nombre/', curso_views.cambiarNombre),
    path('cambiar-fecha<str:keyword>/', curso_views.cambiarFecha),
    path('cambiar-descripcion/', curso_views.cambiarDescripcion),
    path('guardar-tarea/', curso_views.guardarTarea),

    path('t<int:tarea_id>/', include(tarea_patterns))
]

profesor_patterns = [
    path('', profesor_views.index),
    path('cursos/', profesor_views.cursos),
    path('registrar-curso/', profesor_views.registrarCurso),

    path('curso<int:num>/', include(curso_patterns))
]

urlpatterns = [
    path('', views.index, name='index'),
    path('datos-registro/', views.datosRegistro),
    path('registro/', views.registrar),
    path('login/', views.login_view),
    path('logout/', views.logout_view),

    path('profesor/', include(profesor_patterns))
]