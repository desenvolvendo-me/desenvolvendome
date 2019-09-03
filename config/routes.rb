Rails.application.routes.draw do

  get 'visit/index'
  get 'home/index'
  get 'welcome/index'

  root 'home#index'

end
