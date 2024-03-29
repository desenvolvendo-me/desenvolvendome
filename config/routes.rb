# == Route Map
#
#                                Prefix Verb       URI Pattern                                                                              Controller#Action
#                                  root GET        /                                                                                        visits#index
#                      new_user_session GET        /users/sign_in(.:format)                                                                 devise/sessions#new
#                          user_session POST       /users/sign_in(.:format)                                                                 devise/sessions#create
#                  destroy_user_session DELETE     /users/sign_out(.:format)                                                                devise/sessions#destroy
#        user_github_omniauth_authorize GET|POST   /users/auth/github(.:format)                                                             users/omniauth_callbacks#passthru
#         user_github_omniauth_callback GET|POST   /users/auth/github/callback(.:format)                                                    users/omniauth_callbacks#github
#                     new_user_password GET        /users/password/new(.:format)                                                            devise/passwords#new
#                    edit_user_password GET        /users/password/edit(.:format)                                                           devise/passwords#edit
#                         user_password PATCH      /users/password(.:format)                                                                devise/passwords#update
#                                       PUT        /users/password(.:format)                                                                devise/passwords#update
#                                       POST       /users/password(.:format)                                                                devise/passwords#create
#                          visits_index GET        /visits/index(.:format)                                                                  visits#index
#                        visits_privacy GET        /visits/privacy(.:format)                                                                visits#privacy
#                              contacts GET        /contacts(.:format)                                                                      contacts#index
#                                       POST       /contacts(.:format)                                                                      contacts#create
#                           new_contact GET        /contacts/new(.:format)                                                                  contacts#new
#                          edit_contact GET        /contacts/:id/edit(.:format)                                                             contacts#edit
#                               contact GET        /contacts/:id(.:format)                                                                  contacts#show
#                                       PATCH      /contacts/:id(.:format)                                                                  contacts#update
#                                       PUT        /contacts/:id(.:format)                                                                  contacts#update
#                                       DELETE     /contacts/:id(.:format)                                                                  contacts#destroy
#                             interests GET        /interests(.:format)                                                                     interests#index
#                                       POST       /interests(.:format)                                                                     interests#create
#                          new_interest GET        /interests/new(.:format)                                                                 interests#new
#                              interest GET        /interest(.:format)                                                                      interests#show
#                              profiles GET        /profiles(.:format)                                                                      profiles#index
#                          profile_show GET        /profile/:id(.:format)                                                                   profiles#show
#                          hide_profile GET        /hide/profile(.:format)                                                                  profiles#hide
#                               analyze GET        /analyze(.:format)                                                                       profiles#new
#                                       POST       /analyze(.:format)                                                                       profiles#create
#                              historic GET        /historic/:login(.:format)                                                               profiles#historic
#                     repositories_user GET        /repositories/:login(.:format)                                                           repositories#user
#                 reimport_repositories POST       /reimport_repositories(.:format)                                                         importations#repositories
#                   reimport_repository POST       /reimport_repository(.:format)                                                           importations#repository
#                            knowledges GET        /knowledges(.:format)                                                                    knowledges#index
#                       knowledges_user GET        /knowledges/:login(.:format)                                                             knowledges#user
#                         reimport_rule GET        /reimport/rule(.:format)                                                                 profiles#reimport_rule
#                                  rule GET        /rule(.:format)                                                                          profiles#rule
#                              rankings GET        /rankings(.:format)                                                                      rankings#index
#                     rankings_starteds GET        /rankings/starteds(.:format)                                                             rankings#starteds
#                      rankings_novices GET        /rankings/novices(.:format)                                                              rankings#novices
#                      rankings_knights GET        /rankings/knights(.:format)                                                              rankings#knights
#                          compare_show GET        /profile/:user/compare/:compared(.:format)                                               compares#show
#                               compare POST       /compare(.:format)                                                                       compares#create
#                                       GET        /404(.:format)                                                                           errors#not_found
#                                       GET        /500(.:format)                                                                           errors#internal_server_error
#                new_admin_user_session GET        /admin/login(.:format)                                                                   active_admin/devise/sessions#new
#                    admin_user_session POST       /admin/login(.:format)                                                                   active_admin/devise/sessions#create
#            destroy_admin_user_session DELETE|GET /admin/logout(.:format)                                                                  active_admin/devise/sessions#destroy
#               new_admin_user_password GET        /admin/password/new(.:format)                                                            active_admin/devise/passwords#new
#              edit_admin_user_password GET        /admin/password/edit(.:format)                                                           active_admin/devise/passwords#edit
#                   admin_user_password PATCH      /admin/password(.:format)                                                                active_admin/devise/passwords#update
#                                       PUT        /admin/password(.:format)                                                                active_admin/devise/passwords#update
#                                       POST       /admin/password(.:format)                                                                active_admin/devise/passwords#create
#                            admin_root GET        /admin(.:format)                                                                         admin/dashboard#index
#                          admin_perfis GET        /admin/perfis(.:format)                                                                  admin/perfis#index
#                         admin_visitas GET        /admin/visitas(.:format)                                                                 admin/visitas#index
#                      admin_linguagens GET        /admin/linguagens(.:format)                                                              admin/linguagens#index
#                         admin_acessos GET        /admin/acessos(.:format)                                                                 admin/acessos#index
#                       admin_dashboard GET        /admin/dashboard(.:format)                                                               admin/dashboard#index
#                   reimport_admin_user GET        /admin/users/:id/reimport(.:format)                                                      admin/users#reimport
#              batch_action_admin_users POST       /admin/users/batch_action(.:format)                                                      admin/users#batch_action
#                           admin_users GET        /admin/users(.:format)                                                                   admin/users#index
#                            admin_user GET        /admin/users/:id(.:format)                                                               admin/users#show
#          batch_action_admin_interests POST       /admin/interests/batch_action(.:format)                                                  admin/interests#batch_action
#                       admin_interests GET        /admin/interests(.:format)                                                               admin/interests#index
#                                       POST       /admin/interests(.:format)                                                               admin/interests#create
#                    new_admin_interest GET        /admin/interests/new(.:format)                                                           admin/interests#new
#                   edit_admin_interest GET        /admin/interests/:id/edit(.:format)                                                      admin/interests#edit
#                        admin_interest GET        /admin/interests/:id(.:format)                                                           admin/interests#show
#                                       PATCH      /admin/interests/:id(.:format)                                                           admin/interests#update
#                                       PUT        /admin/interests/:id(.:format)                                                           admin/interests#update
#                                       DELETE     /admin/interests/:id(.:format)                                                           admin/interests#destroy
#           batch_action_admin_contacts POST       /admin/contacts/batch_action(.:format)                                                   admin/contacts#batch_action
#                        admin_contacts GET        /admin/contacts(.:format)                                                                admin/contacts#index
#                                       POST       /admin/contacts(.:format)                                                                admin/contacts#create
#                     new_admin_contact GET        /admin/contacts/new(.:format)                                                            admin/contacts#new
#                    edit_admin_contact GET        /admin/contacts/:id/edit(.:format)                                                       admin/contacts#edit
#                         admin_contact GET        /admin/contacts/:id(.:format)                                                            admin/contacts#show
#                                       PATCH      /admin/contacts/:id(.:format)                                                            admin/contacts#update
#                                       PUT        /admin/contacts/:id(.:format)                                                            admin/contacts#update
#                                       DELETE     /admin/contacts/:id(.:format)                                                            admin/contacts#destroy
#          batch_action_admin_languages POST       /admin/languages/batch_action(.:format)                                                  admin/languages#batch_action
#                       admin_languages GET        /admin/languages(.:format)                                                               admin/languages#index
#                   edit_admin_language GET        /admin/languages/:id/edit(.:format)                                                      admin/languages#edit
#                        admin_language GET        /admin/languages/:id(.:format)                                                           admin/languages#show
#                         admin_sidekiq GET        /admin/sidekiq(.:format)                                                                 admin/sidekiq#index
#       batch_action_admin_api_controls POST       /admin/api_controls/batch_action(.:format)                                               admin/api_controls#batch_action
#                    admin_api_controls GET        /admin/api_controls(.:format)                                                            admin/api_controls#index
#                     admin_api_control GET        /admin/api_controls/:id(.:format)                                                        admin/api_controls#show
#        batch_action_admin_admin_users POST       /admin/admin_users/batch_action(.:format)                                                admin/admin_users#batch_action
#                     admin_admin_users GET        /admin/admin_users(.:format)                                                             admin/admin_users#index
#                                       POST       /admin/admin_users(.:format)                                                             admin/admin_users#create
#                  new_admin_admin_user GET        /admin/admin_users/new(.:format)                                                         admin/admin_users#new
#                 edit_admin_admin_user GET        /admin/admin_users/:id/edit(.:format)                                                    admin/admin_users#edit
#                      admin_admin_user GET        /admin/admin_users/:id(.:format)                                                         admin/admin_users#show
#                                       PATCH      /admin/admin_users/:id(.:format)                                                         admin/admin_users#update
#                                       PUT        /admin/admin_users/:id(.:format)                                                         admin/admin_users#update
#                                       DELETE     /admin/admin_users/:id(.:format)                                                         admin/admin_users#destroy
#                        admin_comments GET        /admin/comments(.:format)                                                                admin/comments#index
#                                       POST       /admin/comments(.:format)                                                                admin/comments#create
#                         admin_comment GET        /admin/comments/:id(.:format)                                                            admin/comments#show
#                                       DELETE     /admin/comments/:id(.:format)                                                            admin/comments#destroy
#                           sidekiq_web            /sidekiq                                                                                 Sidekiq::Web
#                           ahoy_engine            /ahoy                                                                                    Ahoy::Engine
#                           vuejs_index GET        /vuejs/index(.:format)                                                                   vuejs#index
#                     letter_opener_web            /mail/inbox                                                                              LetterOpenerWeb::Engine
#         rails_mandrill_inbound_emails POST       /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
#         rails_postmark_inbound_emails POST       /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
#            rails_relay_inbound_emails POST       /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
#         rails_sendgrid_inbound_emails POST       /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
#          rails_mailgun_inbound_emails POST       /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
#        rails_conductor_inbound_emails GET        /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
#                                       POST       /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
#     new_rails_conductor_inbound_email GET        /rails/conductor/action_mailbox/inbound_emails/new(.:format)                             rails/conductor/action_mailbox/inbound_emails#new
#    edit_rails_conductor_inbound_email GET        /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                        rails/conductor/action_mailbox/inbound_emails#edit
#         rails_conductor_inbound_email GET        /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
#                                       PATCH      /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       PUT        /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       DELETE     /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
# rails_conductor_inbound_email_reroute POST       /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
#                    rails_service_blob GET        /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#             rails_blob_representation GET        /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                    rails_disk_service GET        /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#             update_rails_disk_service PUT        /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                  rails_direct_uploads POST       /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create
# 
# Routes for Ahoy::Engine:
# visits POST /visits(.:format) ahoy/visits#create
# events POST /events(.:format) ahoy/events#create
# 
# Routes for LetterOpenerWeb::Engine:
# clear_letters DELETE /clear(.:format)                 letter_opener_web/letters#clear
# delete_letter DELETE /:id(.:format)                   letter_opener_web/letters#destroy
#       letters GET    /                                letter_opener_web/letters#index
#        letter GET    /:id(/:style)(.:format)          letter_opener_web/letters#show
#               GET    /:id/attachments/:file(.:format) letter_opener_web/letters#attachment

Rails.application.routes.draw do

  root 'visits#index'

  #Usuários
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  #Visitantes
  get 'visits/index'
  get 'visits/privacy'

  #Contato
  resources :contacts

  #Interesse
  resources :interests, except: [:show, :edit, :destroy, :update]
  get "interest", to: "interests#show"

  # TODO: Organizar resources, adicionando rota customizada somente onde precisar
  #Profile
  get "profiles", to: "profiles#index"
  get "profile/:id", to: "profiles#show", as: "profile_show"
  get "hide/profile", to: "profiles#hide"
  ##Analyze
  get "analyze", to: "profiles#new"
  post "analyze", to: "profiles#create"
  get "historic/:login", to: "profiles#historic", as: :historic
  ##Repositórios
  get "repositories/:login", to: "repositories#user", as: "repositories_user"
  ##Importação
  post "reimport_repositories", to: "importations#repositories"
  post "reimport_repository", to: "importations#repository"
  ##Conhecimentos
  get "knowledges", to: "knowledges#index"
  get "knowledges/:login", to: "knowledges#user", as: "knowledges_user"
  ##Reimportação
  get "reimport/rule", to: "profiles#reimport_rule"
  ##Rule
  get "rule", to: "profiles#rule"

  #Ranking
  get "rankings", to: "rankings#index"
  get "rankings/starteds", to: "rankings#starteds"
  get "rankings/novices", to: "rankings#novices"
  get "rankings/knights", to: "rankings#knights"

  #Compare
  get "profile/:user/compare/:compared", to: "compares#show", as: "compare_show"
  post "compare", to: "compares#create"

  #Custom
  get '/404', to: "errors#not_found"
  get '/500', to: "errors#internal_server_error"

  #Admin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  mount Ahoy::Engine => "/ahoy"

  #POC, view funcionando com vuejs
  get 'vuejs/index'

  #Dev, facilitar desenvolvimento com envio de email
  mount LetterOpenerWeb::Engine, at: "/mail/inbox" if Rails.env.development?

end
