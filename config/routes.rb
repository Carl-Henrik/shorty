Rails.application.routes.draw do
  resources :links, only: [:new, :create, :destroy]
  root to: "home#index"
  # Sending incoming urls not matched to existing routes via get to short_redirect method in links controller
  # the entered url is stored in params hash with key :url_short
  match ':url_short', to: 'links#short_redirect', via: [:get]
end
