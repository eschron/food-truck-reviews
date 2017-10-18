Rails.application.routes.draw do

  devise_for :users, :skip => [:passwords], controllers: {
    registrations: "registrations",
    sessions: "sessions"}

  root "home#index"


  resources :trucks, only: [:index]
  resources :users, only: [:show]

end
