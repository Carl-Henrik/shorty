class VisitsController < ApplicationController
  # Restricts access to  logged in admins
  before_action :authenticate_admin!
  # collect all entrys in visits table and store them in @visits which is available in view index.html.erb
  def index
    @visits = Visit.all
  end

  # deletes all entries in visits table
  # redirects to Visit#index
  def empty_logg
    Visit.delete_all
    flash[:success] = 'Logg was successfully deleted!'
    redirect_to visits_path
  end
end
