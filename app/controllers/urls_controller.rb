class UrlsController < ApplicationController
  def index
    # Most 10 recent urls
    @urls = Url.order(visitors_count: :desc).limit(10)
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
    @url = Url.find_by(slug: params[:slug])
    if @url
      @url.update_stats(request.remote_ip)
      redirect_to @url.original
    else
      redirect_to urls_path, flash: { error: 'Shortened url not found' }
    end
  end

  def details
    @url = Url.find_by(slug: params[:slug])
  end

  private

  def url_params
    params.require(:url).permit(:original)
  end
end
