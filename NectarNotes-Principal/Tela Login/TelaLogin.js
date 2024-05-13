document.getElementById('loginForm').addEventListener('submit', function(event) {
    // Evitar o envio padrão do formulário
    event.preventDefault();
    
    // Redirecionar para a página desejada (substitua "pagina_de_destino.html" pelo URL da página)
    window.location.href = "index.html";
});