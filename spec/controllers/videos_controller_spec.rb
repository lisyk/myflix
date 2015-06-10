require 'spec_helper'

describe VideosController do
  describe 'GET show' do
    context "with authenticated users" do
      before do
        session[:user_id] = Fabricate(:user).id
      end
      it "sets @video" do
        video = Fabricate(:video)
        get :show, id: video.id
        expect(assigns(:video)).to eq(video)
      end

      it "renders the show template" do
        video = Fabricate(:video)
        get :show, id: video.id
        expect(response).to render_template('show')
      end
    end

    context "with unauthenticate users" do
      it "redirects the user to sign in page" do
        video = Fabricate(:video)
        get :show, id: video.id
        expect(response).to redirect_to sign_in_path

      end
    end
  end
end
