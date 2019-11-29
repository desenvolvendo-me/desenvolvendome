# == Route Map
#
#                                Prefix Verb     URI Pattern                                                                              Controller#Action
#                     letter_opener_web          /mail/inbox                                                                              LetterOpenerWeb::Engine
#                           sidekiq_web          /sidekiq/admin                                                                           Sidekiq::Web
#                           rails_admin          /admin/app                                                                               RailsAdmin::Engine
#                      new_user_session GET      /users/sign_in(.:format)                                                                 devise/sessions#new
#                          user_session POST     /users/sign_in(.:format)                                                                 devise/sessions#create
#                  destroy_user_session DELETE   /users/sign_out(.:format)                                                                devise/sessions#destroy
#        user_github_omniauth_authorize GET|POST /users/auth/github(.:format)                                                             users/omniauth_callbacks#passthru
#         user_github_omniauth_callback GET|POST /users/auth/github/callback(.:format)                                                    users/omniauth_callbacks#github
#                     new_user_password GET      /users/password/new(.:format)                                                            devise/passwords#new
#                    edit_user_password GET      /users/password/edit(.:format)                                                           devise/passwords#edit
#                         user_password PATCH    /users/password(.:format)                                                                devise/passwords#update
#                                       PUT      /users/password(.:format)                                                                devise/passwords#update
#                                       POST     /users/password(.:format)                                                                devise/passwords#create
#                     new_admin_session GET      /admins/sign_in(.:format)                                                                devise/sessions#new
#                         admin_session POST     /admins/sign_in(.:format)                                                                devise/sessions#create
#                 destroy_admin_session DELETE   /admins/sign_out(.:format)                                                               devise/sessions#destroy
#                    new_admin_password GET      /admins/password/new(.:format)                                                           devise/passwords#new
#                   edit_admin_password GET      /admins/password/edit(.:format)                                                          devise/passwords#edit
#                        admin_password PATCH    /admins/password(.:format)                                                               devise/passwords#update
#                                       PUT      /admins/password(.:format)                                                               devise/passwords#update
#                                       POST     /admins/password(.:format)                                                               devise/passwords#create
#             cancel_admin_registration GET      /admins/cancel(.:format)                                                                 devise/registrations#cancel
#                new_admin_registration GET      /admins/sign_up(.:format)                                                                devise/registrations#new
#               edit_admin_registration GET      /admins/edit(.:format)                                                                   devise/registrations#edit
#                    admin_registration PATCH    /admins(.:format)                                                                        devise/registrations#update
#                                       PUT      /admins(.:format)                                                                        devise/registrations#update
#                                       DELETE   /admins(.:format)                                                                        devise/registrations#destroy
#                                       POST     /admins(.:format)                                                                        devise/registrations#create
#                                  root GET      /                                                                                        visits#index
#                          visits_index GET      /visits/index(.:format)                                                                  visits#index
#                             interests GET      /interests(.:format)                                                                     interests#index
#                                       POST     /interests(.:format)                                                                     interests#create
#                          new_interest GET      /interests/new(.:format)                                                                 interests#new
#                              interest GET      /interest(.:format)                                                                      interests#show
#                              rankings GET      /rankings(.:format)                                                                      profiles#index
#                              analysis GET      /analysis(.:format)                                                                      users#index
#                              new_user GET      /analyze(.:format)                                                                       users#new
#                                 users POST     /analyze(.:format)                                                                       users#create
#                                  user GET      /profile/:id(.:format)                                                                   users#show
#                           vuejs_index GET      /vuejs/index(.:format)                                                                   vuejs#index
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
# 
# Routes for RailsAdmin::Engine:
#   dashboard GET         /                                      rails_admin/main#dashboard
#       index GET|POST    /:model_name(.:format)                 rails_admin/main#index
#         new GET|POST    /:model_name/new(.:format)             rails_admin/main#new
#      export GET|POST    /:model_name/export(.:format)          rails_admin/main#export
# bulk_delete POST|DELETE /:model_name/bulk_delete(.:format)     rails_admin/main#bulk_delete
# bulk_action POST        /:model_name/bulk_action(.:format)     rails_admin/main#bulk_action
#        show GET         /:model_name/:id(.:format)             rails_admin/main#show
#        edit GET|PUT     /:model_name/:id/edit(.:format)        rails_admin/main#edit
#      delete GET|DELETE  /:model_name/:id/delete(.:format)      rails_admin/main#delete
# show_in_app GET         /:model_name/:id/show_in_app(.:format) rails_admin/main#show_in_app

Rails.application.routes.draw do
  resources :contacts

  root 'visits#index'

  #Visits
  get 'visits/index'

  #Interests
  resources :interests, except: [:show, :edit, :destroy, :update]
  get "interest", to: "interests#show", as: "interest"


  #Analyze
  get "rankings", to: "profiles#index"
  get "rankings/starteds", to: "profiles#starteds", as: "starteds"
  get "rankings/novices", to: "profiles#novices", as: "novices"
  get "rankings/knights", to: "profiles#knights", as: "knights"
  get "analysis", to: "users#index"
  get "analyze", to: "users#new", as: "new_user"
  post "analyze", to: "users#create", as: "users"
  get "profile/:id", to: "users#show", as: "user"

  # Rodando Vuejs
  get 'vuejs/index'

  mount LetterOpenerWeb::Engine, at: "/mail/inbox" if Rails.env.development?
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq/admin'

  mount RailsAdmin::Engine => '/admin/app', as: 'rails_admin'

  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
  devise_for :admins
end
