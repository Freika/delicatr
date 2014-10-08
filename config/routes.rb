Rails.application.routes.draw do
  devise_for :users
  resources :posts, except: :show do
    member { post :vote }
  end

  resources :blogs
  root "posts#index"
end
