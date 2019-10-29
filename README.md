#Variaveis de Ambiente

## Email Server
- ENV["DOMAIN_NAME"]
- ENV["SENDGRID_USERNAME"]
- ENV["SENDGRID_PASSWORD"]

## Errbit Server
- ENV["ERRBIT_DOMAIN"]
- ENV["ERRBIT_PROJECT_ID"]
- ENV["ERRBIT_PROJECT_KEY"]

# TESTE
## Email Preview
http://localhost:3000/rails/mailers

# INFORMAÇÕES

## Deploy

### Heroku

```
heroku run bash
rails db:migrate 
rails c
Rails.application.load_seed
```
PS: Por algum muito motivo rodar o `rails db:seed` via `heroku run rails db:seed` não funciona

## Infraestrutura

- [Errbit (Digital Ocean)](https://github.com/errbit/errbit)
- [Email Server (Sendgrind)](https://app.sendgrid.com/guide/integrate/langs/smtp)

#QUALIDADE

## Qualidade de Código
```
shell> rubycritic app
```
Acesse: http://localhost:63342/desenvolvendome/tmp/rubycritic/overview.html


## Cobertura de Código

```
shell> rspec spec
```

Acesse: http://localhost:63342/desenvolvendome/coverage/index.html
