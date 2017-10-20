Rails.application.routes.draw do
  devise_for :users,
    skip: [:passwords],
    controllers: { registrations: "registrations", sessions: "sessions"}

  root "home#index"

  namespace :api do
    resources :reviews, only: [:create]

    resources :trucks, only: [:show] do
      resources :reviews, only: [:index]
    end
  end

  resources :trucks
  
  resources :users, only: [:show]
end
