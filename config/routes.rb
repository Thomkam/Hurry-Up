Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"

  get '/choose_restaurant', to: 'pages#choose_restaurant'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :sitting_areas, only: [:show] do
    resources :orders, only: %i[new create]
  end

  resources :orders, only: %i[update destroy]
  resources :restaurants, except: [:index]
  resources :items, only: %i[new create]
end
