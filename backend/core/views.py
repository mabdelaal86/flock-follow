from django.db.models import F
from django.db.models.functions import math
from django.shortcuts import get_object_or_404
from rest_framework import status
from rest_framework.views import APIView
from rest_framework.response import Response
from .models import User, Flock
from .serializers import UserSerializer, FlockSerializer, MessageSerializer


class UserList(APIView):
    def post(self, request):
        serializer = UserSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class UserDetail(APIView):
    def get(self, request, pk):
        user = get_object_or_404(User, pk=pk)
        serializer = UserSerializer(user)
        return Response(serializer.data)

    def put(self, request, pk):
        user = get_object_or_404(User, pk=pk)
        serializer = UserSerializer(user, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class FlockList(APIView):
    def get(self, request):
        lat = request.query_params.get('lat', None)
        lng = request.query_params.get('lng', None)

        if (lat is None) or (lng is None):
            serializer = FlockSerializer([], many=True)
            return Response(serializer.data)

        q = Flock.objects.annotate(distence=math.Sqrt((F('latitude')-lat) ** 2 + (F('longitude')-lng) ** 2))
        flocks = q.filter(distence__lte=0.05)
        serializer = FlockSerializer(flocks, many=True)
        return Response(serializer.data)

    def post(self, request):
        serializer = FlockSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class FlockDetail(APIView):
    def get(self, request, pk):
        flock = get_object_or_404(Flock, pk=pk)
        serializer = FlockSerializer(flock)
        return Response(serializer.data)

    def put(self, request, pk):
        flock = get_object_or_404(Flock, pk=pk)
        serializer = FlockSerializer(flock, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class MemberList(APIView):
    def get(self, request, pk):
        flock = get_object_or_404(Flock, pk=pk)
        serializer = UserSerializer(flock.members, many=True)
        return Response(serializer.data)


class MemberDetail(APIView):
    def post(self, request, pk, member_id):
        flock = get_object_or_404(Flock, pk=pk)
        user = get_object_or_404(User, pk=member_id)
        flock.members.add(user)
        flock.save()
        return Response(status=status.HTTP_204_NO_CONTENT)

    def delete(self, request, pk, member_id):
        flock = get_object_or_404(Flock, pk=pk)
        user = get_object_or_404(User, pk=member_id)
        flock.members.remove(user)
        flock.save()
        return Response(status=status.HTTP_204_NO_CONTENT)


class MessageList(APIView):
    def get(self, request, pk):
        flock = get_object_or_404(Flock, pk=pk)
        serializer = MessageSerializer(flock.messages, many=True)
        return Response(serializer.data)

    def post(self, request, pk):
        flock = get_object_or_404(Flock, pk=pk)
        request.data['flock'] = flock.id

        serializer = MessageSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
