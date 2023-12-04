Rails.application.routes.draw do
  resources :posts do
    resources :comments 
  end
  post 'like', to: 'posts#like', as: 'like'
  post 'like_comment/:id', to: 'posts#like_comment', as: 'like_comment'
  delete 'like_comment/:id', to: 'posts#unlike_comment', as: 'unlike_comment'
  
  post 'reply_like', to: 'comments#like_reply', as: 'reply_like'
  post 'comment', to: 'posts#comment', as: 'comment'
  post 'reply', to: 'comments#reply', as: 'comment_reply'
  delete 'destroy_reply/:id', to: 'comments#destroy_reply', as: 'destroy_reply'
  devise_for :users
  root "home#index"
  get 'about', to: 'home#about'
end
