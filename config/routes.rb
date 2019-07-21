Rails.application.routes.draw do
  get 'sessions/new'
  get '/signup', to: "advisors#new"
  get 'articles/index'
  get 'infos/index'
  root "pages#index"
  
  resources :advisors
  resources :articles

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

end
