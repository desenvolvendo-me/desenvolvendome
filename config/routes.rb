# == Route Map
#
#                                Prefix Verb     URI Pattern                                                                              Controller#Action
#                           sidekiq_web          /sidekiq                                                                                 Sidekiq::Web
#                     letter_opener_web          /mail/inbox                                                                              LetterOpenerWeb::Engine
#        user_github_omniauth_authorize GET|POST /users/auth/github(.:format)                                                             devise/omniauth_callbacks#passthru
#         user_github_omniauth_callback GET|POST /users/auth/github/callback(.:format)                                                    devise/omniauth_callbacks#github
#                                  root GET      /                                                                                        visits#index
#                          visits_index GET      /visits/index(.:format)                                                                  visits#index
#                          new_interest GET      /interesse(.:format)                                                                     interests#new
#                             interests POST     /interesse(.:format)                                                                     interests#create
#                              interest GET      /interesse/confirmacao(.:format)                                                         interests#show
#                            avaliacoes GET      /avaliacoes(.:format)                                                                    users#index
#                              new_user GET      /avaliacao(.:format)                                                                     users#new
#                                 users POST     /avaliacao(.:format)                                                                     users#create
#                     confirmation_user GET      /avaliacao/confirmacao(.:format)                                                         users#confirmation
#                                  user GET      /perfil/:id(.:format)                                                                    users#show
#         rails_mandrill_inbound_emails POST     /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
#         rails_postmark_inbound_emails POST     /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
#            rails_relay_inbound_emails POST     /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
#         rails_sendgrid_inbound_emails POST     /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
#          rails_mailgun_inbound_emails POST     /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
#        rails_conductor_inbound_emails GET      /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
#                                       POST     /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
#     new_rails_conductor_inbound_email GET      /rails/conductor/action_mailbox/inbound_emails/new(.:format)                             rails/conductor/action_mailbox/inbound_emails#new
#    edit_rails_conductor_inbound_email GET      /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                        rails/conductor/action_mailbox/inbound_emails#edit
#         rails_conductor_inbound_email GET      /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
#                                       PATCH    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       PUT      /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       DELETE   /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
# rails_conductor_inbound_email_reroute POST     /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
#                    rails_service_blob GET      /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#             rails_blob_representation GET      /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                    rails_disk_service GET      /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#             update_rails_disk_service PUT      /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                  rails_direct_uploads POST     /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create
# 
# Routes for LetterOpenerWeb::Engine:
# clear_letters DELETE /clear(.:format)                 letter_opener_web/letters#clear
# delete_letter DELETE /:id(.:format)                   letter_opener_web/letters#destroy
#       letters GET    /                                letter_opener_web/letters#index
#        letter GET    /:id(/:style)(.:format)          letter_opener_web/letters#show
#               GET    /:id/attachments/:file(.:format) letter_opener_web/letters#attachment

Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/mail/inbox" if Rails.env.development?
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq/admin'

  mount RailsAdmin::Engine => '/admin/app', as: 'rails_admin'

  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
  devise_for :admins

  root 'visits#index'

  #Visits
  get 'visits/index'

  #Interests
  resources :interests, except: [:show, :edit, :destroy, :update]
  get "interest", to: "interests#show", as: "interest"


  #Analyze
  get "analysis", to: "users#index"
  get "analyze", to: "users#new", as: "new_user"
  post "analyze", to: "users#create", as: "users"
  get "profile/:id", to: "users#show", as: "user"

  # Rodando Vuejs
  get 'vuejs/index'

end
