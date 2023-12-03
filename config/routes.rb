Rails.application.routes.draw do
  resources :posts do
    resources :comments 
  end
  post 'like', to: 'posts#like', as: 'like'
  post 'comment_like', to: 'posts#like_comment', as: 'comment_like'
  post 'comment', to: 'posts#comment', as: 'comment'
  devise_for :users
  root "home#index"
  get 'about', to: 'home#about'
end
