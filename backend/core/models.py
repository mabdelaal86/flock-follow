from django.db import models


class User(models.Model):
    USER_STATUSES = (
        ('R', 'Registered'),
        ('A', 'Approved'),  # If phone is approved
    )

    name = models.CharField(max_length=100)
    about = models.CharField(max_length=200, blank=True)
    phone = models.CharField(max_length=50, unique=True)
    status = models.CharField(max_length=1, choices=USER_STATUSES, default='R')
    latitude = models.DecimalField(max_digits=10, decimal_places=7)
    longitude = models.DecimalField(max_digits=10, decimal_places=7)
    created_at = models.DateTimeField(auto_now_add=True)


class Flock(models.Model):
    FLOCK_STATUSES = (
        ('S', 'Standby'),
        ('R', 'Running'),
        ('F', 'Finished'),
    )

    title = models.CharField(max_length=50)
    description = models.CharField(max_length=200)
    status = models.CharField(max_length=1, choices=FLOCK_STATUSES, default='S')
    password = models.CharField(max_length=20, blank=True)
    destination = models.CharField(max_length=200, blank=True)
    latitude = models.DecimalField(max_digits=10, decimal_places=7)
    longitude = models.DecimalField(max_digits=10, decimal_places=7)
    created_at = models.DateTimeField(auto_now_add=True)
    started = models.DateTimeField(blank=True, null=True)
    finished = models.DateTimeField(blank=True, null=True)

    leader = models.ForeignKey(User, related_name='created_flocks', on_delete=models.CASCADE)
    members = models.ManyToManyField(User, related_name='joined_flocks')


class Message(models.Model):
    content = models.CharField(max_length=200)
    created_at = models.DateTimeField(auto_now_add=True)

    user = models.ForeignKey(User, related_name='messages', on_delete=models.CASCADE)
    flock = models.ForeignKey(Flock, related_name='messages', on_delete=models.CASCADE)
