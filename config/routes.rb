Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "main#index"

  get 'main/index'

  resources :discussions do
    resources :posts, module: :discussions

    resources :notifications, only: :create, module: :discussions
    collection do
      get "category/:id", to: "categories/discussions#index", as: :category
    end
  end

  resources :categories

  post "sign_up", to: "users#create"
  get "sign_up", to: "users#new"
  put "account", to: "users#update"
  get "account", to: "users#edit"
  delete "account", to: "users#destroy"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "login", to: "sessions#new"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
