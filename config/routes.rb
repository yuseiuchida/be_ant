Rails.application.routes.draw do
  root to: 'homes#top'
  get 'mypage' => 'homes#mypage'
  get 'login' => 'user_sessions#new', as: :login
  post 'login' => 'user_sessions#create'
  delete 'logout' => 'user_sessions#destroy', as: :logout
  resources :records
  resources :goals do
    member do
      patch :update_status
    end
  end
  resources :kinds
  resources :users, only: %i[new create]
end
