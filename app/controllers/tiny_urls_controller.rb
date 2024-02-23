class TinyUrlsController < ApplicationController
  before_action :authenticate_user!
  def index
    @urls = current_user.TinyUrls
  end

  def create
    url = tiny_url_params[:original_url]
    @tiny_url = TinyUrl.create(original_url: url, user_id: current_user.id)
    logger.debug "New tiny url: #{@tiny_url.valid?}"
    if !@tiny_url.valid?
      redirect_to root_path, error: @tiny_url.errors.full_messages.join(', ')
    else
      redirect_to root_path, success: 'Sucessfully created new URl'
    end
  end

  def show
    @tiny_url = TinyUrl.find_by(new_url: params[:new_url])
    redirect_to @tiny_url.formatted_original_url, allow_other_host: true
  end

  private

  def tiny_url_params
    params.require(:tiny_url).permit(:original_url)
  end
end
