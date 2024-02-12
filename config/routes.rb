Rails.application.routes.draw do
  require 'sidekiq/web'

  mount Sidekiq::Web => '/sidekiq'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    resources :movies do
      collection do
        post 'import'
      end
    end
    resources :reviews do
      collection do
        post 'import'
      end
    end
  end

  root to: 'movies#index'
  resources :movies, only: [:show, :index]
end
