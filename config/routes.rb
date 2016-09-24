Rails.application.routes.draw do
  get 'web_app/index'
  root 'web_app#index'
end
