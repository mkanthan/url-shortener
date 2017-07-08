class LinksController < ApplicationController
  respond_to :json, only: [:create]

  def index
  end

  def create
    @link = Link.find_by_url(link_params[:url]) ||
    Link.create(link_params)
    respond_with(@link)
  end

  private
    def link_params
      params.require(:link).permit(:url)
    end

end