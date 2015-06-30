Myflix::Application.routes.draw do

  root 'pages#front'
  resources :videos, only: [:show] do
    collection do
      get :search, to: "videos#search"
    end
    resources :reviews
  end

  get 'ui(/:action)', controller: 'ui'
  get '/register', to: 'users#new'
  get 'sign_in', to: 'sessions#new'
  get '/home', to: 'videos#index'
  get 'sign_out', to: 'sessions#destroy'
  get 'my_queue', to: 'queue_items#index'
  resources :users, only: [:create]
  resources :sessions, only: [:create]
  resources :categories, only: [:show]
  resources :queue_items, only: [:create, :destroy]
end
