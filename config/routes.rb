Rails.application.routes.draw do
  get 'sessions/new'
  get 'advisors/new'
  get 'articles/index'
  get 'infos/index'
  get 'pages/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#index"
  
  resources :advisors

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

end
