Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :update, :new, :create, :destroy, :index]
  resources :sent_requests
  resources :matches

  get '/profile/:id', to: 'users#profile', as: 'profile'

  get "/login", to: "session#login", as: "login"
  post "/login", to: "session#create"
  delete "/logout", to: "session#destory"
end
