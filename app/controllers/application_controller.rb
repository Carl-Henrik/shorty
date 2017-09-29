class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Redirects user to visits#index after successful login
  protected
  def after_sign_in_path_for(resource)
    visits_path
  end
end
