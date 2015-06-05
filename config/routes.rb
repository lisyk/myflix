Myflix::Application.routes.draw do

  root 'pages#front'
  resources :videos, only: [:show] do
    collection do
      get :search, to: "videos#search"
    end
  end
  get 'ui(/:action)', controller: 'ui'
  get '/register', to: 'users#new'
  get 'sign_in', to: 'sessions#new'
  get '/home', to: 'videos#index'
  get 'sign_out', to: 'sessions#destroy'
  resources :users, only: [:create]
  resources :sessions, only: [:create]
end
