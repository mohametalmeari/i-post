Rails.application.routes.draw do
  resources :posts do
    resources :comments 
  end
  post 'like/:id', to: 'posts#like', as: 'like'
  delete 'unlike/:id', to: 'posts#unlike', as: 'unlike'

  post 'like_comment/:id', to: 'posts#like_comment', as: 'like_comment'
  delete 'like_comment/:id', to: 'posts#unlike_comment', as: 'unlike_comment'
  
  post 'like_reply/:id', to: 'comments#like_reply', as: 'like_reply'
  delete 'unlike_reply/:id', to: 'comments#unlike_reply', as: 'unlike_reply'


  post 'comment', to: 'posts#comment', as: 'comment'
  post 'reply', to: 'comments#reply', as: 'comment_reply'
  delete 'destroy_reply/:id', to: 'comments#destroy_reply', as: 'destroy_reply'
  devise_for :users
  root "home#index"
  get 'about', to: 'home#about'
end
