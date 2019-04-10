from django.db import models
from django.contrib.auth.models import (
    BaseUserManager, AbstractBaseUser
)

class Rol(models.Model):
    nombre = models.CharField(max_length=200)

    def __str__(self):
    	return self.nombre

    class Meta:
        managed = False
        db_table = 'rol'

class Persona(models.Model):
    nombres = models.CharField(max_length=100)
    apellidos = models.CharField(max_length=100)
    correo = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'persona'

class MyUserManager(BaseUserManager):
    def create_user(self, nombre, password, rol_id, persona_id):
        """
        Creates and saves a User with the given email, date of
        birth and password.
        """
        if not nombre:
            raise ValueError('Debe tener un nombre de usuario.')

        if not password:
            raise ValueError('Debe tener una contraseña.')

        if not rol_id:
            raise ValueError('Debe tener un rol.')

        user = self.model(
            nombre=nombre,
            rol_id=rol_id,
            persona_id=persona_id
        )

        user.set_password(password)
        user.save(using=self._db)
        return user


class Usuario (AbstractBaseUser):
    nombre = models.CharField(
        max_length=255,
        unique=True,
    )

    rol = models.ForeignKey(Rol, on_delete=models.CASCADE)
    persona = models.ForeignKey(Persona, on_delete=models.CASCADE)

    updated = models.DateTimeField(auto_now=True)
    created = models.DateTimeField(auto_now_add=True)

    objects = MyUserManager()

    USERNAME_FIELD = 'nombre'

    def __str__(self):
        return self.nombre

    def has_perm(self, perm, obj=None):
        "Does the user have a specific permission?"
        # Simplest possible answer: Yes, always
        return True

    def has_module_perms(self, app_label):
        "Does the user have permissions to view the app `app_label`?"
        # Simplest possible answer: Yes, always
        return True

    @property
    def is_staff(self):
        "Is the user a member of staff?"
        # Simplest possible answer: All admins are staff
        return True

    class Meta:
        db_table = 'usuario'