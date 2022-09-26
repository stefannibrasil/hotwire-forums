Rails.application.routes.draw do
  root to: "discussions#index"

  resources :discussions do
    resources :posts, module: :discussions

    resources :notifications, only: :create, module: :discussions
    collection do
      get "category/:id", to: "categories/discussions#index", as: :category
    end
  end

  resources :notifications, only: :index do
    collection do
      post '/mark_as_read', to: "notifications#read_all", as: :read
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
end
