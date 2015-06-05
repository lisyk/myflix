class VideosController < ApplicationController
  layout "application"

  before_filter :require_user

  def index
    @categories = Category.all
  end

  def show
    @video = Video.find(params[:id])
  end

  def search
    @results = Video.search_by_title(params[:search_item])
  end
end
