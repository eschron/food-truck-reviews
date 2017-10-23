Rails.application.routes.draw do
  devise_for :users,
    skip: [:passwords],
    controllers: { registrations: "registrations", sessions: "sessions"}

  root "home#index"

  namespace :api do
    resources :reviews, only: [:create] do
      resources :votes, only: [:create, :index]
    end

    resources :users, only: [:show]

    resources :trucks, only: [:show] do
      resources :reviews, only: [:index]
    end
  end

  get "/search", to: "trucks#search"

  resources :trucks

  resources :users, only: [:show, :index, :destroy]
end
