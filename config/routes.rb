Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :greetings, only: [:index]
  resources :users do
    resources :favorites, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end
  get '/greetings/random', to: 'greetings#random'
  post "/login", to: "auth#login"
  #get "/auth", to: "auth#authorize_request"

  # Defines the root path route ("/")
  # root "articles#index"
end
