Rails.application.routes.draw do
  devise_for :users,
    skip: [:passwords],
    controllers: { registrations: "registrations", sessions: "sessions"}

  root "home#index"

  namespace :api do
    resources :reviews, only: [:create, :index]
  end

  resources :trucks do
    resources :reviews, only: [:new, :create]
  end
  resources :users, only: [:show]
end
