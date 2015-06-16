require 'spec_helper'

describe ReviewsController do
  describe "POST create" do
    context "with authenticated user" do
      context "with valid input" do
        it "redirects to the video show page" do
          video = Fabricate(:video)
          post :create, review: Fabricate.attributes_for(:review), video_id: video.id
          expect(response).to redirect_to video
        end
        # it "creates review" do
        #   video = Fabricate(:video)
        #   post :create, review: Fabricate.attributes_for(:review), video_id: video.id
        #   expect(Review.count).to eq(1)
        # end
        it "creates review associated with video"
        it "creates review associated with the signed in user"
        it "redirects to the video show page"

      end

      context "with invalid input" do


      end


    end

    context "with unauthenticated user" do


    end

  end

end
