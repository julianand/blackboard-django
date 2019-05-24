from django.urls import path, include

from . import views
from .views_folder import profesor_views

urlpatterns = [
    path('', views.index, name='index'),
    path('datos-registro/', views.datosRegistro),
    path('registro/', views.registrar),
    path('login/', views.login_view),
    path('logout/', views.logout_view),

    path('profesor/', profesor_views.index),
    path('profesor/cursos/', profesor_views.cursos),
    path('profesor/registrar-curso/', profesor_views.registrarCurso),

    path('profesor/curso<int:num>/', profesor_views.curso_view),
    path('profesor/curso<int:num>/datos-curso/', profesor_views.datosCurso),
    path('profesor/curso<int:num>/cambiar-nombre/', profesor_views.cambiarNombre),
    path('profesor/curso<int:num>/cambiar-fecha<str:keyword>/', profesor_views.cambiarFecha),
]