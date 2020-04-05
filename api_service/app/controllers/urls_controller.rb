require 'base64'

class UrlsController < ApplicationController
  before_action :set_url, only: [:navigate]

  # GET /urls
  def index
    @urls = Url.more_visited
    render json: @urls
  end

  # POST 
  def navigate
    binding.pry
    @url.visit_count += 1
    @url.save
    render json: @url
  end

  # POST /urls
  def create
    @url = Url.new(url_params)
    @url.short_url = shorten(url_params[:original_url])

    if @url.save
      render json: @url, status: :created, location: @url
    else
      render json: @url.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url
      binding.pry
      @url = Url.find_by!('short_url': params[:data][:short_url])
    end

    # Only allow a trusted parameter "white list" through.
    def url_params
      params.require(:data).permit(:original_url)
    end

    def shorten(original_url)
      validated_url = handle_prefix(original_url)
      'test.angel/'.concat(encode(validated_url))
    end

    def handle_prefix(link)
      if link[0..6] != 'http://' && link[0..7] != 'https://'
        return 'http://' + link
      end
  
      link
    end

    def encode(link)
      Base64.encode64(link)[0..5]
    end
end
