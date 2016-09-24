Rails.application.routes.draw do
  namespace :api do
    resources :issues, only: [:create, :index]
  end
end
