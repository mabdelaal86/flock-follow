from django.db import models

# Create your models here.

class User(models.Model):
    name = models.CharField(max_length=20, null=True)
    about = models.CharField(max_length=30, null=True)
    phone = models.CharField(max_length=20, null=True) # no frequent
#    status =  models.()
    latitude = models.CharField(max_length=150, null=True)
    longitude = models.CharField(max_length=150, null=True)

class Flcks(models.Model):
    title = models.CharField(max_length=25, null=True)
    description = models.CharField(max_length=101, null=True)
#    status =  models.()
    password = models.CharField(max_length=55, null=True)
    destination = models.CharField(max_length=300, null=True)
    latitude = models.CharField(max_length=150, null=True)
    longitude = models.CharField(max_length=150, null=True)
    leader_id = models.OneToOneField(User ,on_delete=models.CASCADE)

class Messages(models.Model):
    date_time = models.DateTimeField(auto_now_add=True)
    contect = models.CharField(max_length=50, null=True)
    user_id = models.ForeignKey(User ,on_delete=models.CASCADE)
    flock_id = models.ForeignKey(Flcks ,on_delete=models.CASCADE)

class Flock_User(models.Model):
   user_id = models.ForeignKey(User ,on_delete=models.CASCADE)
   flock_id = models.ForeignKey(Flcks ,on_delete=models.CASCADE)
