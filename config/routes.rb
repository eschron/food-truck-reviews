Rails.application.routes.draw do
  devise_for :users,
    skip: [:passwords],
    controllers: { registrations: "registrations"}

  root "home#index"

  namespace :api do
    resources :reviews, only: [:create, :index]
  end

  resources :trucks, only: [:index, :show] do
    resources :reviews, only: [:new, :create]
  end
end
