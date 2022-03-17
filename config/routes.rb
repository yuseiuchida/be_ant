Rails.application.routes.draw do
  resources :kinds
  resources :goals
  resources :records
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get 'login' => 'user_sessions#new', as: :login
  post 'login' => 'user_sessions#create'
  delete 'logout' => 'user_sessions#destroy', as: :logout
  get 'mypage' => 'homes#mypage'
  resources :users, only: %i[new create]
end
