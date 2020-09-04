from django.contrib import admin

# Register your models here.
from .models import Messages, User  , Flcks ,Flock_User

admin.site.register(Messages)
admin.site.register(User)
admin.site.register(Flcks)
admin.site.register(Flock_User)
