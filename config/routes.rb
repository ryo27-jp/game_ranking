Rails.application.routes.draw do
  root to: 'games#index'
  resources :likes
  resources :users
  resources :games do
    resources :reviews, shallow: true
  end

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
