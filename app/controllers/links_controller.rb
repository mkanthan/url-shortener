class LinksController < ApplicationController
  respond_to :json, only: [:create]

  def index
  end

  def show
    @link = Link.find_by_unique_id(params[:unique_id])
    redirect_to "http://#{@link.url}" if @link
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