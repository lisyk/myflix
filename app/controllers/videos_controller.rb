class VideosController < ActionController::Base
  layout "application"

  def index
    @videos = Video.all
  end
end
