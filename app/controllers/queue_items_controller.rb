class QueueItemsController < ApplicationController
before_filter :require_user
  def index
    @queue_items = current_user.queue_items
  end

  def create
    video = Video.find(params[:video_id])
    QueueItem.create(video: video, user: current_user, position: queue_position) unless QueueItem.find_by video: video
    redirect_to my_queue_path
  end

  private

  def queue_position
    QueueItem.all.size + 1
  end


end
