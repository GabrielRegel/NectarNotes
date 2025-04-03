# NectarNotes

NectarNotes é um projeto desenvolvido para gerenciar notas de forma eficiente e organizada. Ele utiliza o framework Django para o backend, gerencia dependências com Poetry e é executado em um ambiente Dockerizado para facilitar a configuração e a portabilidade.

## Índice

- [Descrição](#descrição)
- [Tecnologias Utilizadas](#tecnologias-utilizadas)
- [Instalação](#instalação)
- [Como Usar](#como-usar)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Contribuição](#contribuição)
- [Licença](#licença)

---

## Descrição

O NectarNotes é uma aplicação web que permite criar, editar e organizar notas. Ele foi projetado para ser simples de usar, mas poderoso o suficiente para atender às necessidades de usuários individuais ou equipes.

> **Nota:** A pasta `OLDPROJECT` foi descontinuada e não faz parte do novo fluxo de desenvolvimento.

## Tecnologias Utilizadas

- [Django](https://www.djangoproject.com/) - Framework web para o backend.
- [Poetry](https://python-poetry.org/) - Gerenciador de dependências e ambiente virtual.
- [Docker](https://www.docker.com/) - Para criar e gerenciar contêineres.

## Instalação

Siga os passos abaixo para configurar o projeto localmente:

1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/nectarnotes.git
   ```
2. Acesse o diretório do projeto:
   ```bash
   cd nectarnotes
   ```
3. Instale o Poetry, caso ainda não tenha:
   ```bash
   pip install poetry
   ```
4. Instale as dependências do projeto:
   ```bash
   poetry install
   ```
5. Configure as variáveis de ambiente:
   - O projeto inclui um arquivo `example.env` com as variáveis de ambiente necessárias.
   - Copie o arquivo `example.env` para `.env`:
     ```bash
     cp example.env .env
     ```
   - Edite o arquivo `.env` conforme necessário para ajustar as configurações do seu ambiente.
   
6. Configure o ambiente Docker:
   - Certifique-se de que o Docker está instalado e em execução.
   - Construa a imagem Docker:
     ```bash
     docker-compose build
     ```
   - Inicie o contêiner:
     ```bash
     docker-compose up
     ```

7. Crie um superusuário para acessar o painel administrativo:
   ```bash
   docker-compose exec web python manage.py createsuperuser
   ```



## Como Usar

1. Após iniciar o contêiner, acesse a aplicação no navegador:
   ```
   http://localhost:8000
   ```
2. Para registrar um novo usuário, acesse:
   ```
   http://localhost:8000/register
   ```

### Acessar o Painel Administrativo

Acesse o painel administrativo pelo seguinte endereço:
```
http://127.0.0.1:8000/admin
```
> **Importante:** Certifique-se de usar `http://127.0.0.1:8000/` para evitar problemas de autenticação entre URLs.

## Estrutura do Projeto

A estrutura principal do projeto é a seguinte:

```
/nectarnotes
  /app          # Código principal da aplicação Django
  /templates    # Templates HTML
  /static       # Arquivos estáticos (CSS, JS, imagens)
  /docker       # Configurações relacionadas ao Docker
  manage.py     # Script de gerenciamento do Django
  pyproject.toml # Arquivo de configuração do Poetry
```

> **Nota:** A pasta `OLDPROJECT` foi mantida apenas para referência histórica e não deve ser utilizada.

## Contribuição

Contribuições são bem-vindas! Siga os passos abaixo para contribuir:

1. Faça um fork do repositório.
2. Crie uma branch para sua feature:
   ```bash
   git checkout -b minha-feature
   ```
3. Faça o commit das suas alterações:
   ```bash
   git commit -m "Adiciona minha nova feature"
   ```
4. Envie para o repositório remoto:
   ```bash
   git push origin minha-feature
   ```
5. Abra um Pull Request.

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).