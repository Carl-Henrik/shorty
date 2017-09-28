Rails.application.routes.draw do
  resources :links, only: [:new, :show, :create, :destroy] do
      get 'search', on: :collection
    end
  root to: "links#new"
  # Sending incoming urls not matched to existing routes via get to short_redirect method in links controller
  # the entered url is stored in params hash with key :url_short
  match ':url_short', to: 'links#short_redirect', via: [:get]
end
