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
    if (@link.valid?)
      render json: { url: "#{request.base_url}/#{@link.unique_id}" }
    else
      respond_with(@link)
    end
  end

  private
    def link_params
      params.require(:link).permit(:url)
    end

end