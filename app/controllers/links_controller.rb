class LinksController < ApplicationController
  before_action :set_link, only: [:destroy]

  # Sets up a new link object (without saving to database) and makes it available to the view
  def new
    @link = Link.new
  end

  # Sets up a new link object with :url from params hash
  # Sends the object to UniqueAttributesAssigner which returns a new object with correct unique attributes
  # Redirects to home#index if object is saved successfuly. Renders new if not.
  def create
    @link = Link.new(url: link_params[:url])
    @link = UniqueAttributesAssigner.ensure_unique(@link)

    if  @link.save
      redirect_to root_path, notice: 'Link was successfully created.'
    else
      render :new
    end
  end

  # Uses destroy method in model to remove the databaseentry related to the link object
  # Redirects to home#index
  def destroy
    @link.destroy
    redirect_to root_path, notice: 'Link was successfully destroyed.'
  end

  # uses contents of params hash to find matching link entry in db
  # redirects user original url
  def short_redirect
    @link = Link.find_by(url_short: params[:url_short])
    if @link.nil?
      redirect_to root_path
    else
      redirect_to @link.url
    end
  end

  private
    # Autogenerated code from creating scafold, sets up @link object from params hash via callback before destroy action
    def set_link
      @link = Link.find(params[:id])
    end

    # Autogenerated code from creating scafold, protects you from forged params hash
    # Removed url_short since its generated internaly
    def link_params
      params.require(:link).permit(:url)
    end
end
