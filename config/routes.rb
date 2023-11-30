Rails.application.routes.draw do
  resources :posts, only: [:index, :new]
  devise_for :users
  root "home#index"
  get 'about', to: 'home#about'
end
