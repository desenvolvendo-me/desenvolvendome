# == Route Map
#
#                                Prefix Verb   URI Pattern                                                                              Controller#Action
#                                  root GET    /                                                                                        perfis#new
#                                perfis POST   /perfis(.:format)                                                                        perfis#create
#                            new_perfil GET    /perfis/new(.:format)                                                                    perfis#new
#                                perfil GET    /perfis/:id(.:format)                                                                    perfis#show
#                           vuejs_index GET    /vuejs/index(.:format)                                                                   vuejs#index
#                        paperkit_index GET    /paperkit/index(.:format)                                                                paperkit#index
#                      paperkit_landing GET    /paperkit/landing(.:format)                                                              paperkit#landing
#                      paperkit_profile GET    /paperkit/profile(.:format)                                                              paperkit#profile
#                     paperkit_register GET    /paperkit/register(.:format)                                                             paperkit#register
#         rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
#         rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
#            rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
#         rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
#          rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
#        rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
#                                       POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
#     new_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/new(.:format)                             rails/conductor/action_mailbox/inbound_emails#new
#    edit_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                        rails/conductor/action_mailbox/inbound_emails#edit
#         rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
#                                       PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
# rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
#                    rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#             rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                    rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#             update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                  rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  mount LetterOpenerWeb::Engine, at: "/mail/inbox" if Rails.env.development?

  root 'visits#index'

  #Visits
  get 'visits/index'

  #Interests
  get 'interesse', to: 'interests#new', as: "new_interest"
  post "interesse", to: "interests#create", as: "interests"
  get 'interesse/confirmacao', to: 'interests#show', as: "interest"

  #Users
  get "avaliacao", to: "users#new", as: "new_user"
  post "avaliacao", to: "users#create", as: "users"
  get "avaliacao/confirmacao", to: "users#confirmation", as: "confirmation_user"
  get "perfil/:id", to: "users#show", as: "user"

  # Exemplo
  # Rodando Vuejs
  get 'vuejs/index'
  # Rodando Elemento Bootstraps
  get 'paperkit/index'
  get 'paperkit/landing'
  get 'paperkit/profile'
  get 'paperkit/register'


end
