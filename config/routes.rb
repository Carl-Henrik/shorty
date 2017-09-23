Rails.application.routes.draw do
  resources :links, only: [:new, :create, :destroy]
  root to: "home#index"
end
