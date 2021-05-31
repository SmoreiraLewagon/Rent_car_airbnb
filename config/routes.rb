Rails.application.routes.draw do
  devise_for :users
  root to: 'cars#home'
  resources :cars, only: [:show, :new, :create] do
    resources :rents, only: [:create]
  end
end
