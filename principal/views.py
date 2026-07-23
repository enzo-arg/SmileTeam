from django.shortcuts import render
from django.db import connection

def inicio(request):
    
    with connection.cursor() as cursor:
      
        cursor.execute("SELECT 1;")
        resultado = cursor.fetchone()

    return render(request, 'principal/inicio.html', {'resultado': resultado})