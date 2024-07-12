Rails.application.routes.draw do
  
  devise_for :users
  root to: "homes#top"
  get 'homes/about', to: 'homes#about', as: :about
  resources :post_images do
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users
  
end
