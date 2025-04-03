from django.contrib.auth import logout
from django.shortcuts import redirect, render

# Create your views here.

def index_view(request):
    data ={}
    return render(request, "base.html", data)
