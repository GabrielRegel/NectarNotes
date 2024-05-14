document.getElementById('signupForm').addEventListener('submit', function(event) {
    event.preventDefault();

    // Aqui você pode adicionar validações de senha e confirmação de senha
    var password = document.getElementsByName('password')[0].value;
    var confirmPassword = document.getElementsByName('confirmPassword')[0].value;
    if (password !== confirmPassword) {
        alert("As senhas não correspondem!");
        return;
    }

    // Redirecionar para a página de login após o cadastro (substitua "login.html" pelo URL da página de login)
    window.location.href = "Tela Principal/index.html";
});
