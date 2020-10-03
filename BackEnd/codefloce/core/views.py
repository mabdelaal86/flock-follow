from django.shortcuts import render
from django.http import HttpResponse
# Create your views here.

def Messages(request, *args, **kwargs):
    # return HttpResponse("<h1> Messages</h1>")
    return render(request, 'mobileapp/lip/appbar.dart')

def Flock_User(request, *args, **kwargs):
    #return HttpResponse("<h1> Flock_user </h1>")
    return render(request, 'mobileapp/lip/')

def Flcks(request, *args, **kwargs):
    #return HttpResponse("<h1> Flcks </h1>")
    return render(request, 'mobileapp/lip/AddFlock.dart')

def User(request, *args, **kwargs):
    #return HttpResponse("<h1> User </h1>")
    return render(request, 'mobileapp/lip/settings.dart')
