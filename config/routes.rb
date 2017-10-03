Rails.application.routes.draw do
  devise_for :admins

  resources :links, only: [:new, :show, :create, :destroy] do
    # Adds route for search action in links controller
    get 'search', on: :collection
  end

  resources :visits do
    # Adds route for empty_logg & index actions in visits controller
    collection do
      get 'empty_logg'
      get 'index'
    end
  end

  # Sets root to new action in links cointroller
  root to: "links#new"
  # Sending incoming urls not matched to existing routes via get to short_redirect method in links controller
  # the entered url is stored in params hash with key :url_short
  match ':url_short', to: 'links#short_redirect', via: [:get]
end
