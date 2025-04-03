from django.shortcuts import render, redirect
from users.forms import CustomUserCreationForm, CustomUserLoginForm
from django.contrib.auth import authenticate, login as auth_login
from django.contrib import messages

from users.models import User

def register_view(request):
    if request.method == 'POST':
        form = CustomUserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('core:index') 
    else:
        form = CustomUserCreationForm()
    return render(request, 'users/register/index.html', {'form': form})

def login_view(request):
    if request.method == 'POST':
        form = CustomUserLoginForm(request.POST)
        if form.is_valid():
            # Get the user based on username or email
            usernameoremail = form.cleaned_data.get('usernameoremail')  # Get the input from the form
            password = form.cleaned_data.get('password')  # Get the password input

            if '@' in usernameoremail:
                try:
                    user = User.objects.get(email=usernameoremail)
                    username = user.username  # Pega o username associado ao e-mail
                except User.DoesNotExist:
                    return None  # Usuário não encontrado
            else:
                username = usernameoremail

            # Authenticate the user using either the username or email
            user = authenticate(request, username=username, password=password)

            if user is not None:
                # Log the user in
                auth_login(request, user)
                messages.success(request, "Login bem-sucedido!")
                return redirect('core:index')  # Redirect to the home page
            else:
                messages.error(request, "Nome de usuário/e-mail ou senha inválidos.")
        else:
            messages.error(request, "Por favor, corrija os erros abaixo.")
    else:
        form = CustomUserLoginForm()

    return render(request, 'users/login/index.html', {'form': form})
    