Rails.application.routes.draw do
  devise_for :users
  root to: 'cars#home'
  resources :cars, only: [:show, :new, :create, :destroy] do
    resources :rents, only: [:create]
  end
end
