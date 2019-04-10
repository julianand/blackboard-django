from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('datos-registro/', views.datosRegistro),
    path('registro/', views.registrar),
    path('login/', views.login)
]