"""flock_follow URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include

from core import views


urlpatterns = [
    #main APIs
    path('admin/', admin.site.urls),
    path('api-auth/', include('rest_framework.urls')),
    path('rest-auth/', include('rest_auth.urls')),
    
    #Flock APIs
    path('privacy-policy/',views.privacy_policyview),
    path('api/v1/users/', views.UserList.as_view()),
    path('api/v1/users/<int:pk>/', views.UserDetail.as_view()),
    path('api/v1/flocks/', views.FlockList.as_view()),
    path('api/v1/flocks/<int:pk>/', views.FlockDetail.as_view()),
    path('api/v1/flocks/<int:pk>/members/', views.MemberList.as_view()),
    path('api/v1/flocks/<int:pk>/members/<int:member_id>/', views.MemberDetail.as_view()),
    path('api/v1/flocks/<int:pk>/messages/', views.MessageList.as_view()),
]
