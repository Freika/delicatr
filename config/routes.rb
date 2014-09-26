Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :blogs
  root "posts#index"
end
