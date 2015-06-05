Myflix::Application.routes.draw do

  root 'videos#index'
  resources :videos, only: [:show] do
    collection do
      get :search, to: "videos#search"
    end
  end
  get 'ui(/:action)', controller: 'ui'
end
