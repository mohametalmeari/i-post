Rails.application.routes.draw do
  post 'like/:id', to: 'posts#like', as: 'like'
  delete 'unlike/:id', to: 'posts#unlike', as: 'unlike'
  
  post 'like_comment/:comment_id', to: 'posts#like_comment', as: 'like_comment'
  delete 'unlike_comment/:comment_id', to: 'posts#unlike_comment', as: 'unlike_comment'
  
  post 'like_reply/:reply_id', to: 'comments#like_reply', as: 'like_reply'
  delete 'unlike_reply/:reply_id', to: 'comments#unlike_reply', as: 'unlike_reply'
  
  post 'comment', to: 'posts#comment', as: 'comment'

  post 'reply', to: 'comments#reply', as: 'comment_reply'
  delete 'destroy_reply/:reply_id', to: 'comments#destroy_reply', as: 'destroy_reply'

  resources :posts do
    resources :comments 
  end
  devise_for :users
  root "home#index"
  get 'about', to: 'home#about'
end
