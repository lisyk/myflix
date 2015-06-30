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

  def destroy
    redirect_to my_queue_path
    queue_item = QueueItem.find(params[:id])
    if queue_item.user == current_user
      queue_item.destroy
    end

  end

  def update_queue
    params[:queue_items].each do |queue_item_data|
      queue_item = QueueItem.find(queue_item_data["id"])
      queue_item.update_attributes(position: queue_item_data["position"])
    end
    redirect_to my_queue_path

  end

  private

  def queue_position
    QueueItem.all.size + 1
  end


end
