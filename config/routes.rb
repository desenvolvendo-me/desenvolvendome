Rails.application.routes.draw do

  resources :reclamacoes
  get 'visit/index'
  get 'home/index'
  get 'welcome/index'

  root 'home#index'

end
