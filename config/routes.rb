# == Route Map
#
#                                Prefix Verb       URI Pattern                                                                              Controller#Action
#                new_admin_user_session GET        /admin/login(.:format)                                                                   active_admin/devise/sessions#new
#                    admin_user_session POST       /admin/login(.:format)                                                                   active_admin/devise/sessions#create
#            destroy_admin_user_session DELETE|GET /admin/logout(.:format)                                                                  active_admin/devise/sessions#destroy
#               new_admin_user_password GET        /admin/password/new(.:format)                                                            active_admin/devise/passwords#new
#              edit_admin_user_password GET        /admin/password/edit(.:format)                                                           active_admin/devise/passwords#edit
#                   admin_user_password PATCH      /admin/password(.:format)                                                                active_admin/devise/passwords#update
#                                       PUT        /admin/password(.:format)                                                                active_admin/devise/passwords#update
#                                       POST       /admin/password(.:format)                                                                active_admin/devise/passwords#create
#                            admin_root GET        /admin(.:format)                                                                         admin/dashboard#index
#             admin_dashboard_avaliacao GET        /admin/dashboard_avaliacao(.:format)                                                     admin/dashboard_avaliacao#index
#          batch_action_admin_interests POST       /admin/interests/batch_action(.:format)                                                  admin/interests#batch_action
#                       admin_interests GET        /admin/interests(.:format)                                                               admin/interests#index
#                                       POST       /admin/interests(.:format)                                                               admin/interests#create
#                    new_admin_interest GET        /admin/interests/new(.:format)                                                           admin/interests#new
#                   edit_admin_interest GET        /admin/interests/:id/edit(.:format)                                                      admin/interests#edit
#                        admin_interest GET        /admin/interests/:id(.:format)                                                           admin/interests#show
#                                       PATCH      /admin/interests/:id(.:format)                                                           admin/interests#update
#                                       PUT        /admin/interests/:id(.:format)                                                           admin/interests#update
#                                       DELETE     /admin/interests/:id(.:format)                                                           admin/interests#destroy
#        batch_action_admin_admin_users POST       /admin/admin_users/batch_action(.:format)                                                admin/admin_users#batch_action
#                     admin_admin_users GET        /admin/admin_users(.:format)                                                             admin/admin_users#index
#                                       POST       /admin/admin_users(.:format)                                                             admin/admin_users#create
#                  new_admin_admin_user GET        /admin/admin_users/new(.:format)                                                         admin/admin_users#new
#                 edit_admin_admin_user GET        /admin/admin_users/:id/edit(.:format)                                                    admin/admin_users#edit
#                      admin_admin_user GET        /admin/admin_users/:id(.:format)                                                         admin/admin_users#show
#                                       PATCH      /admin/admin_users/:id(.:format)                                                         admin/admin_users#update
#                                       PUT        /admin/admin_users/:id(.:format)                                                         admin/admin_users#update
#                                       DELETE     /admin/admin_users/:id(.:format)                                                         admin/admin_users#destroy
#              batch_action_admin_users POST       /admin/users/batch_action(.:format)                                                      admin/users#batch_action
#                           admin_users GET        /admin/users(.:format)                                                                   admin/users#index
#                                       POST       /admin/users(.:format)                                                                   admin/users#create
#                        new_admin_user GET        /admin/users/new(.:format)                                                               admin/users#new
#                       edit_admin_user GET        /admin/users/:id/edit(.:format)                                                          admin/users#edit
#                            admin_user GET        /admin/users/:id(.:format)                                                               admin/users#show
#                                       PATCH      /admin/users/:id(.:format)                                                               admin/users#update
#                                       PUT        /admin/users/:id(.:format)                                                               admin/users#update
#                                       DELETE     /admin/users/:id(.:format)                                                               admin/users#destroy
#                       admin_dashboard GET        /admin/dashboard(.:format)                                                               admin/dashboard#index
#           batch_action_admin_contacts POST       /admin/contacts/batch_action(.:format)                                                   admin/contacts#batch_action
#                        admin_contacts GET        /admin/contacts(.:format)                                                                admin/contacts#index
#                                       POST       /admin/contacts(.:format)                                                                admin/contacts#create
#                     new_admin_contact GET        /admin/contacts/new(.:format)                                                            admin/contacts#new
#                    edit_admin_contact GET        /admin/contacts/:id/edit(.:format)                                                       admin/contacts#edit
#                         admin_contact GET        /admin/contacts/:id(.:format)                                                            admin/contacts#show
#                                       PATCH      /admin/contacts/:id(.:format)                                                            admin/contacts#update
#                                       PUT        /admin/contacts/:id(.:format)                                                            admin/contacts#update
#                                       DELETE     /admin/contacts/:id(.:format)                                                            admin/contacts#destroy
#                        admin_comments GET        /admin/comments(.:format)                                                                admin/comments#index
#                                       POST       /admin/comments(.:format)                                                                admin/comments#create
#                         admin_comment GET        /admin/comments/:id(.:format)                                                            admin/comments#show
#                                       DELETE     /admin/comments/:id(.:format)                                                            admin/comments#destroy
#                              contacts GET        /contacts(.:format)                                                                      contacts#index
#                                       POST       /contacts(.:format)                                                                      contacts#create
#                           new_contact GET        /contacts/new(.:format)                                                                  contacts#new
#                          edit_contact GET        /contacts/:id/edit(.:format)                                                             contacts#edit
#                               contact GET        /contacts/:id(.:format)                                                                  contacts#show
#                                       PATCH      /contacts/:id(.:format)                                                                  contacts#update
#                                       PUT        /contacts/:id(.:format)                                                                  contacts#update
#                                       DELETE     /contacts/:id(.:format)                                                                  contacts#destroy
#                                  root GET        /                                                                                        visits#index
#                          visits_index GET        /visits/index(.:format)                                                                  visits#index
#                             interests GET        /interests(.:format)                                                                     interests#index
#                                       POST       /interests(.:format)                                                                     interests#create
#                          new_interest GET        /interests/new(.:format)                                                                 interests#new
#                              interest GET        /interest(.:format)                                                                      interests#show
#                              rankings GET        /rankings(.:format)                                                                      profiles#index
#                              starteds GET        /rankings/starteds(.:format)                                                             profiles#starteds
#                               novices GET        /rankings/novices(.:format)                                                              profiles#novices
#                               knights GET        /rankings/knights(.:format)                                                              profiles#knights
#                              new_user GET        /analyze(.:format)                                                                       users#new
#                                 users POST       /analyze(.:format)                                                                       users#create
#                                  user GET        /profile/:id(.:format)                                                                   users#show
#                               compare GET        /profile/:login_1/compare/:login_2(.:format)                                             compare#new
#                           vuejs_index GET        /vuejs/index(.:format)                                                                   vuejs#index
#                     letter_opener_web            /mail/inbox                                                                              LetterOpenerWeb::Engine
#                           sidekiq_web            /sidekiq/admin                                                                           Sidekiq::Web
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
#                     new_admin_session GET        /admins/sign_in(.:format)                                                                devise/sessions#new
#                         admin_session POST       /admins/sign_in(.:format)                                                                devise/sessions#create
#                 destroy_admin_session DELETE     /admins/sign_out(.:format)                                                               devise/sessions#destroy
#                    new_admin_password GET        /admins/password/new(.:format)                                                           devise/passwords#new
#                   edit_admin_password GET        /admins/password/edit(.:format)                                                          devise/passwords#edit
#                        admin_password PATCH      /admins/password(.:format)                                                               devise/passwords#update
#                                       PUT        /admins/password(.:format)                                                               devise/passwords#update
#                                       POST       /admins/password(.:format)                                                               devise/passwords#create
#             cancel_admin_registration GET        /admins/cancel(.:format)                                                                 devise/registrations#cancel
#                new_admin_registration GET        /admins/sign_up(.:format)                                                                devise/registrations#new
#               edit_admin_registration GET        /admins/edit(.:format)                                                                   devise/registrations#edit
#                    admin_registration PATCH      /admins(.:format)                                                                        devise/registrations#update
#                                       PUT        /admins(.:format)                                                                        devise/registrations#update
#                                       DELETE     /admins(.:format)                                                                        devise/registrations#destroy
#                                       POST       /admins(.:format)                                                                        devise/registrations#create
#                             not_found GET        /404(.:format)                                                                           errors#not_found
#                       something_wrong GET        /500(.:format)                                                                           errors#internal_server_error
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
# Routes for LetterOpenerWeb::Engine:
# clear_letters DELETE /clear(.:format)                 letter_opener_web/letters#clear
# delete_letter DELETE /:id(.:format)                   letter_opener_web/letters#destroy
#       letters GET    /                                letter_opener_web/letters#index
#        letter GET    /:id(/:style)(.:format)          letter_opener_web/letters#show
#               GET    /:id/attachments/:file(.:format) letter_opener_web/letters#attachment

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
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
  get "analyze", to: "users#new", as: "new_user"
  post "analyze", to: "users#create", as: "users"
  get "profile/:id", to: "users#show", as: "user"

  get "compare", to: "compares#new", as: "compare_new"
  post "compare", to: "compares#create", as: "compares"

  get "profile/:login_1/compare/:login_2", to: "compares#show", as: "compare"

  # Rodando Vuejs
  get 'vuejs/index'

  mount LetterOpenerWeb::Engine, at: "/mail/inbox" if Rails.env.development?
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq/admin'

  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
  devise_for :admins

  get '/404', to: "errors#not_found", as: "not_found", :via => :all
  get '/500', to: "errors#internal_server_error", as: "something_wrong", :via => :all
end
