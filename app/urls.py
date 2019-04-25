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
    path('profesor/registrar-curso', profesor_views.registrarCurso)
]