# INFORMAÇÕES
## Desenvolvendo local
### Docker
```
shell> docker-compose run web rake db:create
shell> docker-compose run web rake db:migrate
shell> docker-compose up -d
```
### Sidekiq
```
shell> bundle exec sidekiq -q default
```
Acesse: http://localhost:3000/sidekiq/admin
### Rake
```
shell> rake profile:clean_duplicate            # Clear Duplicate User
shell> rake profile:update[user_login]         # Update Profile
shell> rake profile:update_all                 # Update All Profile
```

## Deploy
### Digital Ocean
```
shell> cap production deploy
```

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

##IGNORAR DAQUI PRA BAIXO (AINDA NÃO DISPONÍVEL)
#Variaveis de Ambiente

## Email Server
- ENV["DOMAIN_NAME"]
- ENV["SENDGRID_USERNAME"]
- ENV["SENDGRID_PASSWORD"]

## Errbit Server
- ENV["ERRBIT_DOMAIN"]
- ENV["ERRBIT_PROJECT_ID"]
- ENV["ERRBIT_PROJECT_KEY"]

## Infraestrutura

- [Errbit (Digital Ocean)](https://github.com/errbit/errbit)
- [Email Server (Sendgrind)](https://app.sendgrid.com/guide/integrate/langs/smtp)