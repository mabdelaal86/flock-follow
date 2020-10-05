from rest_framework import serializers
from .models import User, Flock, Message


class UserSerializer(serializers.ModelSerializer):
    joining_flock = serializers.PrimaryKeyRelatedField(many=False, read_only=True)
    managing_flock = serializers.PrimaryKeyRelatedField(many=False, read_only=True)

    class Meta:
        model = User
        fields = [
            'id', 'name', 'about', 'phone', 'status', 'latitude', 'longitude',
            'joining_flock', 'managing_flock'
        ]
        read_only_fields = ['joining_flock', 'managing_flock']


class FlockSerializer(serializers.ModelSerializer):
    class Meta:
        model = Flock
        fields = [
            'id', 'title', 'description', 'status', 'password',
            'destination', 'latitude', 'longitude',
            'created_at', 'started_at', 'finished_at',
            'leader',
        ]


class MessageSerializer(serializers.ModelSerializer):
    class Meta:
        model = Message
        fields = ['id', 'content', 'created_at', 'user', 'flock']
