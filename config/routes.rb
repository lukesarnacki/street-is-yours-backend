Rails.application.routes.draw do

  get 'web_app/index'
  resources :users
  resources :issues
  post 'sessions/login'
  post 'sessions/logout'
  root 'web_app#index'

  namespace :api do
    resources :issues, only: [:create, :index]
  end
end
