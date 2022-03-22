Rails.application.routes.draw do
  root to: 'homes#top'
  get 'login' => 'user_sessions#new', as: :login
  post 'login' => 'user_sessions#create'
  delete 'logout' => 'user_sessions#destroy', as: :logout
  resources :mypages, only: %i[show]
  resources :users, only: %i[new create]
  resources :records do
    resources :reactions, only: %i[create destroy]
  end
  resources :goals do
    member do
      patch :update_status
    end
  end
  resources :kinds
  namespace :admin do
    root to: 'dashboards#index'
    get 'login', to: 'user_sessions#new'
    post 'login', to: 'user_sessions#create'
    delete 'logout', to: 'user_sessions#destroy'
    resources :users, only: %i[index edit update show destroy]
    resources :records, only: %i[index edit update show destroy]
    resources :goals, only: %i[index edit update show destroy]
    resources :kinds
  end
end
