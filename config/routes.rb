Rails.application.routes.draw do
  devise_for :users
  resources :posts, except: :show
  resources :blogs
  root "posts#index"
end
