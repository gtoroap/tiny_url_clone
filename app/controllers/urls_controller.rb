class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    @url.generate_short_url

    if @url.save
      redirect_to urls_path
    else
      flash.now[:error] = 'Please, provide a correct Url.'
      render 'new'
    end
  end

  def short
  end

  private

  def url_params
    params.require(:url).permit(:original)
  end
end
