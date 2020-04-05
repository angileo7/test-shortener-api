require './lib/url_shortener'

class UrlsController < ApplicationController
  before_action :set_url, only: [:show]

  # GET /urls
  def index
    @urls = Url.take(100)
    render json: @urls
  end

  # GET /urls/1
  def show
    @url.visit_count += 1
    @url.save
    render json: @url
  end

  # POST /urls
  def create
    @url = Url.new(url_params)
    @url.short_url = UrlShortener.shorten(url_params[:original_url])

    if @url.save
      render json: @url, status: :created, location: @url
    else
      render json: @url.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url
      @url = Url.find_by!(params[:short_url])
    end

    # Only allow a trusted parameter "white list" through.
    def url_params
      params.require(:data).permit(:original_url)
    end
end
