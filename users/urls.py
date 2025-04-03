from django.urls import path


from users.apps import UsersConfig
from users.views import register_view, login_view

app_name = UsersConfig.name

urlpatterns = [
    path('register/', register_view, name='register'),
    path('login/', login_view, name='login'),
    #path('logout/', auth_views.LogoutView.as_view(), name='logout'),
]
