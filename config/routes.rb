Rails.application.routes.draw do
  get 'dashboard/index'
  devise_for :users, controllers: { registrations: "users/registrations", sessions: "users/sessions" }
  root to: "pages#home"

  get '/choose_restaurant', to: 'pages#choose_restaurant'
  get '/assign_restaurant', to: 'pages#assign_restaurant'

  resources :sitting_areas, only: [:show] do
    resources :items, only: %i[create]
    resources :orders, only: %i[new show] do
      collection do
        get :add_order
        get :remove_order
      end
    end
  end

  resources :orders, only: %i[update destroy ] do
    member do
      post :toggle_status
    end
    collection do
      patch :update_all
    end
  end

  resources :restaurants, except: [:index]
end
