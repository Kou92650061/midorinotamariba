Rails.application.routes.draw do
  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
  
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    resources :dashboards, only: [:index]
    resources :post_comments, only: [:index, :destroy]
    resources :users, only: [:destroy]
  end

  devise_for :users
  
  root to: "homes#top"
  get 'homes/about', to: 'homes#about', as: :about
  get "search" => "searches#search"
  resources :post_images do
    resource :nice, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users
  resources :ranks
end
