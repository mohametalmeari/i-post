Rails.application.routes.draw do
  resources :posts #, only: [:index, :new]
  post 'like', to: 'posts#like', as: 'like'
  devise_for :users
  root "home#index"
  get 'about', to: 'home#about'
end
