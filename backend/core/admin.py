from django.contrib import admin

# Register your models here.
from .models import Message, User, Flock

admin.site.register(Message)
admin.site.register(User)
admin.site.register(Flock)
