# from rest_framework import serializers
# from django.db import models
# from .models import Messages, Flcks, User #,Flock_id
#
#
# class MessagesSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Messages
#         fields = (
#             'date_time',
#             'contect',
#             'user_id',
#             'flock_id',
#         )
#
#
# # class Flock_idSerializer(serializers.ModelSerializer):
# #     class Meta:
# #         model = Flock_id
# #         fields = (
# #             'user_id',
# #             'flock_id',
# #         )
#
#
# class FlcksSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Flcks
#         fields = (
#             'title',
#             'description',
#             #'status',
#             'password',
#             'destination',
#             'latitude',
#             'longitude',
#             #'leader_id',
#         )
#
#
# class UserSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = User
#         fields = (
#             'name',
#             'about',
#             'phone',
#             #'status',
#             'latitude',
#             'longitude',
#
#         )
