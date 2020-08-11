from django.db import models

# Create your models here.


class Messages(models.Model):
    date_time = models.DateTimeField(auto_now_add=True)
    contect = models.CharField(max_length=50)
#    user_id = models.ForeignKey(User ,on_delete=models.CASCADE)
#   flock_id = models.ForeignKey(Flcks ,on_delete=models.CASCADE)

#class Flock_user(models.Model):
#    user_id = models.ForeignKey(User ,on_delete=models.CASCADE)
#    flock_id = models.primaryKey(Flcks ,on_delete=models.CASCADE)

class Post(models.Model):
    title = models.CharField(max_length=25)
    description = models.CharField(max_length=101)
#    status =  models.()
    password = models.CharField(max_length=55)
    destination = models.CharField(max_length=300)
    latitude = models.CharField(max_length=150)
    longitude = models.CharField(max_length=150)
#    leader_id = models.OneToOneField(User ,on_delete=models.CASCADE)


class User(models.Model):
    name = models.CharField(max_length=20)
    about = models.CharField(max_length=30)
    phone = models.CharField(max_length=20) # no frequent
#    status =  models.()
    latitude = models.CharField(max_length=150)
    longitude = models.CharField(max_length=150)


    def __str__(self):
        return self.title