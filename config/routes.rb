Rails.application.routes.draw do
  devise_for :users
  resources :posts, except: :show do
    member do
      post 'like',    to: 'posts#like'
      post 'dislike', to: 'posts#dislike'
    end
  end

  resources :blogs
  root "posts#index"
end
