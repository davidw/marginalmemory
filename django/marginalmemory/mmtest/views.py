from django.shortcuts import render_to_response
from django.template import Context, loader
from django.http import HttpResponse
from datetime import datetime

# Create your views here.

def index(request):
    return render_to_response('mmtest/index.html', {'today': datetime.now()})
