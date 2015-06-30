require 'spec_helper'

describe QueueItemsController do
  describe "GET index" do
    it "sets @queue_items to the queue items of the logged user" do
      alice = Fabricate(:user)
      session[:user_id] = alice.id
      queue_item1 = Fabricate(:queue_item, user: alice)
      queue_item2 = Fabricate(:queue_item, user: alice)
      get :index
      expect(assigns(:queue_items)).to match_array([queue_item1, queue_item2])
    end
    it "redirects to sign in page for unauthenticated users" do
      get 'index'
      expect(response).to redirect_to sign_in_path
    end
  end

  describe "POST create" do
    let(:lisyk) {Fabricate(:user)}
    it "redirects to my queue page for authenticated user" do
      session[:user_id] = lisyk.id
      video = Fabricate(:video)
      post 'create', video_id: video.id
      expect(response).to redirect_to my_queue_path
    end
    it "create queue item" do
      session[:user_id] = lisyk.id
      video = Fabricate(:video)
      post 'create', video_id: video.id
      expect(QueueItem.all.size).to eq(1)
    end
    it "creates queue items assiciated with video" do
      session[:user_id] = lisyk.id
      video = Fabricate(:video)
      post 'create', video_id: video.id
      expect(QueueItem.first.video).to eq(video)
    end
    it "creates queue item associated with signed in user" do
      session[:user_id] = lisyk.id
      video = Fabricate(:video)
      post 'create', video_id: video.id, user_id: lisyk.id
      expect(QueueItem.first.user).to eq(lisyk)
    end
    it "puts the video as the last in the queue" do
      session[:user_id] = lisyk.id
      video1 = Fabricate(:video)
      Fabricate(:queue_item, video: video1, user: lisyk)
      video2 = Fabricate(:video)
      post 'create', user_id: lisyk.id, video_id: video2.id
      expect(QueueItem.last.video).to eq(video2)
    end
    it "does not put the video in the queue if that video alredy in the queue" do
      session[:user_id] = lisyk.id
      video = Fabricate(:video)
      Fabricate(:queue_item, video: video, user: lisyk)
      post 'create', video_id: video.id
      expect(QueueItem.all.size).to eq(1)
    end
    it "redirect to the sign in page for unauthenticated user" do
      post 'create'
      expect(response).to redirect_to sign_in_path
    end
  end

  describe "DELETE destroy" do
    it "redirects to my_queue_path" do
      session[:user_id] = Fabricate(:user).id
      queue_item = Fabricate(:queue_item)
      delete :destroy, id: queue_item.id
      expect(response).to redirect_to my_queue_path
    end
    it "destroy queue item" do
      lisyk = Fabricate(:user)
      session[:user_id] = lisyk.id
      queue_item = Fabricate(:queue_item, user: lisyk)
      delete :destroy, id: queue_item.id
      expect(QueueItem.all.size).to eq(0)

    end
    it "does not allow to delete item that belongs to other user" do
      lisyk = Fabricate(:user)
      session[:user_id] = lisyk.id
      sasha = Fabricate(:user)
      queue_item = Fabricate(:queue_item, user: sasha)
      delete :destroy, id: queue_item.id
      expect(QueueItem.all.size).to eq(1)


    end
    it "redirects to sign in page for unauthenticated users" do
      queue_item = Fabricate(:queue_item)
      delete :destroy, id: queue_item.id
      expect(response).to redirect_to sign_in_path

    end


  end

  describe "POST update_queue" do
    context "with valid inputs" do
      it "redirect to the my queue page" do
        lisyk = Fabricate(:user)
        session[:user_id] = lisyk.id
        queueitem1 = Fabricate(:queue_item, position: 1)
        queueitem2 = Fabricate(:queue_item, position: 2)
        post :update_queue, queue_items: [{id: queueitem1.id, position: 2}, {id: queueitem2.id, position: 1}]
        expect(response).to redirect_to my_queue_path
      end
      it "reorders the queue items" do
        lisyk = Fabricate(:user)
        session[:user_id] = lisyk.id
        queueitem1 = Fabricate(:queue_item, position: 1)
        queueitem2 = Fabricate(:queue_item, position: 2)
        post :update_queue, queue_items: [{id: queueitem1.id, position: 2}, {id: queueitem2.id, position: 1}]
        expect(queueitem1.position).to eq(2)

      end

    end
    context "with invalid inputs"
    context "with unauthenticated users"
    context "with queue items that belong to the current user"


  end

end
