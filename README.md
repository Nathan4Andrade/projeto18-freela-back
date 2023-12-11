# Catwalk Pet Agency (Back-end)

Este projeto é o back-end de um sistema de cadastro e gerenciamento de gatos famosos para uma agência de modelos. A aplicação foi desenvolvida como parte do Desafio Técnico e utiliza tecnologias como Node.js, Express, Joi, Bcrypt, e PostgreSQL.

## Demo
https://catwalk-api.onrender.com

## Funcionalidades

O projeto oferece endpoints para:

- Cadastro de usuários na agência.
- Autenticação de usuários.
- Cadastro e gerenciamento de modelos de gatos.
- Consulta de modelos disponíveis.
- Atualização de informações do usuário autenticado.

## Entidades

*Usuário:*

json
{
  "id": 1,
  "createdAt": "2023-12-01T12:00:00.000Z",
  "updatedAt": "2023-12-01T12:00:00.000Z",
  "name": "Nome do Usuário",
  "cpf": "123.456.789-00",
  "telephone": "(99) 99999-9999",
  "email": "usuario@email.com",
  "picture": "https://example.com/picture.jpg",
  "description": "Descrição do usuário"
}


*Modelo de pet*

json
{
  "id": 1,
  "createdAt": "2023-12-01T12:00:00.000Z",
  "updatedAt": "2023-12-01T12:00:00.000Z",
  "name": "Nome do Pet",
  "description": "Descrição do Pet",
  "picture": "https://example.com/pet.jpg",
  "pictureUserPet": "https://example.com/user_pet.jpg",
  "available": true,
  "userId": 1
}

## Rotas

*A API oferece os seguintes endpoints:*

- POST /signup: Cadastra um novo usuário na agência.

- POST /signin: Autentica um usuário.

- GET /user/info: Obtém as informações do usuário autenticado.

- PUT /user/info: Atualiza as informações do usuário autenticado.

- POST /model: Cria um novo modelo de pet.

- GET /models: Obtém todos os modelos disponíveis.

- GET /models/me: Obtém os modelos cadastrados pelo usuário autenticado.

- GET /models/:id: Obtém informações detalhadas sobre um modelo específico.

- PUT /models/:id: Atualiza a disponibilidade de um modelo.


## Tecnologias utilizadas

*Para esse projeto, foram utilizadas:*

- Node.js (versão 18.17.0)
- Express
- PostgreSQL
- Bcrypt
- Joi

## Como Rodar em Desenvolvimento

1. Clone o repositório.

2. Instale as dependências com o comando: npm install.

3. Crie o arquivo .env com base no .env.example e configure as variáveis necessárias.

4. Execute o comando para criar o banco de dados e as tabelas necessárias: npx sequelize db:migrate.

5. Execute o comando para rodar o projeto em desenvolvimento: npm start.

6. A API estará disponível em http://localhost:5000.

## Testes Manuais

Testes manuais podem ser feitos através de ferramentas como Thunder Client ou Postman.
