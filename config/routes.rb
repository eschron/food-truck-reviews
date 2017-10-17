Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations"}
  root "home#index"
  resources :trucks, only: [:index]
end
