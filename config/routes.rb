Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :greetings, only: [:index]
  resources :users,  only: [:create, :destroy] do
    resources :favorites, only: [:index, :create, :destroy]
  end
  get '/greetings/random', to: 'greetings#random'
  post "/login", to: "auth#login"
  #get "/auth", to: "auth#authorize_request"

  # Defines the root path route ("/")
  # root "articles#index"
end
