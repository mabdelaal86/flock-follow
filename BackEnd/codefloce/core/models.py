from django.db import models

# Create your models here.

class User(models.Model):
    name = models.CharField(max_length=20)
    about = models.CharField(max_length=30)
    phone = models.CharField(max_length=20) # no frequent
#    status =  models.()
    latitude = models.CharField(max_length=150)
    longitude = models.CharField(max_length=150)

class Flcks(models.Model):
    title = models.CharField(max_length=25)
    description = models.CharField(max_length=101)
#    status =  models.()
    password = models.CharField(max_length=55)
    destination = models.CharField(max_length=300)
    latitude = models.CharField(max_length=150)
    longitude = models.CharField(max_length=150)
    leader_id = models.OneToOneField(User ,on_delete=models.CASCADE)

class Messages(models.Model):
    date_time = models.DateTimeField(auto_now_add=True)
    contect = models.CharField(max_length=50)
    user_id = models.ForeignKey(User ,on_delete=models.CASCADE)
    flock_id = models.ForeignKey(Flcks ,on_delete=models.CASCADE)

class Flock_User(models.Model):
   user_id = models.ForeignKey(User ,on_delete=models.CASCADE)
   flock_id = models.ForeignKey(Flcks ,on_delete=models.CASCADE)
