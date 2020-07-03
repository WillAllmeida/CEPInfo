# CEPInfo

Versões das tecnologias utilizadas:

Ruby: 2.50
Rails: 6.0.3

Para rodar o projeto primeiro será necessário digitar o comando abaixo para instalar as gems:

```
$ bundle install
```

Após isso, as migrations deverão ser aplicadas para a criação do banco de dados:
```
$ rails db:migrate
```

Após isso é recomendado a criação de um usuário por meio do shell, cadastrando email, senha e confirmação de senha.

Com o usuário criado, o servidor deverá ser inicializado com o comando:
```
$ rails s
```
# Rotas

## Rota para autenticação e retorno do token do usuário cadastrado
Parâmetros(JSON): email & password

POST
```
http://localhost:3000/authenticate
```

## Cadastrar informações do CEP informado
Parâmetro(JSON): cep
Header: Authentication(informando o token retornado na rota de autenticação)

POST
```
localhost:3000/api/addresses
```

## Visualizar CEPs cadastrados
Header: Authentication(informando o token retornado na rota de autenticação)

GET
```
localhost:3000/api/addresses
```

# Testes

Para rodar os testes unitários de routes/models o comando abaixo deverá ser utilizado
```
$ rails test
```

Já os testes da API, deverão ser rodados por meio do RSpec
```
$ bundle exec rspec
```