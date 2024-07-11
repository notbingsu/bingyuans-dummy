require 'sidekiq/web'
Rails.application.routes.draw do
  post 'start_game', to: 'spyfall#start_game'
  post 'quit_game', to: 'spyfall#quit_game'
  post 'make_guess', to: 'spyfall#make_guess'
  get 'spyfall/index'
  get 'spyfall/show'
  get 'spyfall/new'
  get 'spyfall/create'
  root "home#index"
  mount Sidekiq::Web => '/sidekiq'
  get 'home/index'
  post 'home/checkName', to: 'home#checkName'
  post 'whatsup', to: 'home#whatsup'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
