from rest_framework import serializers
from .models import User, Flock, Message


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'name', 'about', 'phone', 'status', 'latitude', 'longitude')


class FlockSerializer(serializers.ModelSerializer):
    class Meta:
        model = Flock
        fields = (
            'id', 'title', 'description', 'status', 'password',
            'destination', 'latitude', 'longitude',
            'created_at', 'started_at', 'finished_at',
            'leader',
        )


class MessageSerializer(serializers.ModelSerializer):
    class Meta:
        model = Message
        fields = ('content', 'created_at', 'user')
