from django.db import models


class User(models.Model):
    USER_STATUSES = (
        ('C', 'Created'),
        ('A', 'Activated'),  # If phone is activated
    )

    name = models.CharField(max_length=100)
    about = models.CharField(max_length=250, blank=True)
    phone = models.CharField(max_length=50, blank=True)
    status = models.CharField(max_length=1, choices=USER_STATUSES, default='C')
    latitude = models.DecimalField(max_digits=10, decimal_places=7)
    longitude = models.DecimalField(max_digits=10, decimal_places=7)
    created_at = models.DateTimeField(auto_now_add=True)
    activated_at = models.DateTimeField(blank=True, null=True)

    def __str__(self):
        return f'[{self.id}]: {self.name[:20]}'

    def joining_flock(self) -> 'Flock':
        return self.joined_flocks.filter(models.Q(status='C') | models.Q(status='S')).first()

    def managing_flock(self) -> 'Flock':
        return self.created_flocks.filter(models.Q(status='C') | models.Q(status='S')).first()


class Flock(models.Model):
    FLOCK_STATUSES = (
        ('C', 'Created'),
        ('S', 'Started'),
        ('F', 'Finished'),
    )

    title = models.CharField(max_length=100)
    description = models.CharField(max_length=250, blank=True)
    status = models.CharField(max_length=1, choices=FLOCK_STATUSES, default='C')
    password = models.CharField(max_length=20)
    destination = models.CharField(max_length=250, blank=True)
    latitude = models.DecimalField(max_digits=10, decimal_places=7)
    longitude = models.DecimalField(max_digits=10, decimal_places=7)
    created_at = models.DateTimeField(auto_now_add=True)
    started_at = models.DateTimeField(blank=True, null=True)
    finished_at = models.DateTimeField(blank=True, null=True)

    leader = models.ForeignKey(User, related_name='created_flocks', on_delete=models.CASCADE)
    members = models.ManyToManyField(User, related_name='joined_flocks')

    def __str__(self):
        return f'[{self.id}]: {self.title[:20]}'


class Message(models.Model):
    content = models.CharField(max_length=250)
    created_at = models.DateTimeField(auto_now_add=True)

    user = models.ForeignKey(User, related_name='messages', on_delete=models.CASCADE)
    flock = models.ForeignKey(Flock, related_name='messages', on_delete=models.CASCADE)

    def __str__(self):
        return f'[{self.id}]: {self.content[:20]}'
