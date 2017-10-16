Rails.application.routes.draw do
  root to: 'events#index'
  devise_for :users

  resources :events, only: [:index, :show]
  resources :searches, only: [:create]

  mount ActionCable.server => '/cable'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
