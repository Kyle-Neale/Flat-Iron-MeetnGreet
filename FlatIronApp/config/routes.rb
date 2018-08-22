Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :update, :new, :create, :destroy]
  resources :sent_requests

  get "/login", to: "session#login", as: "login"
  post "/login", to: "session#create"
end
