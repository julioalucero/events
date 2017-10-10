Rails.application.routes.draw do
  root to: 'events#index'
  devise_for :users

  get 'events/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
