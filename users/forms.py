from django import forms
from django.contrib.auth.forms import UserCreationForm
from users.models import User
from django import forms
from django.core.exceptions import ValidationError
from django.core.validators import EmailValidator

class CustomUserCreationForm(UserCreationForm):
    class Meta:
        model = User
        fields = ['username', 'email', 'password1', 'password2']
        widgets = {
            'username': forms.TextInput(attrs={'class': 'input-field', 'placeholder': 'Nome de usuário'}),
            'email': forms.EmailInput(attrs={'class': 'input-field', 'placeholder': 'Seu e-mail'}),
            'password': forms.PasswordInput(attrs={'class': 'input-field', 'placeholder': 'Crie uma senha'}),
            'passwordconfirm': forms.PasswordInput(attrs={'class': 'input-field', 'placeholder': 'Confirme sua senha'})
        }
        help_texts = {
        'password': '',
        }




class CustomUserLoginForm(forms.Form):
    usernameoremail = forms.CharField(
        max_length=254,
        widget=forms.TextInput(attrs={'class': 'input-field', 'placeholder': 'Nome de usuário ou e-mail'})
    )
    password = forms.CharField(
        widget=forms.PasswordInput(attrs={'class': 'input-field', 'placeholder': 'Sua senha'})
    )


        
