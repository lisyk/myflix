require 'spec_helper'

describe SessionsController do
  describe "GET new" do
    it "renders the new template for new user" do
      get :new
      expect(response).to render_template :new
    end
    it "redirects to the home path for current user" do
      session[:user_id] = Fabricate(:user).id
      get :new
      expect(response).to redirect_to home_path
    end
  end

  describe "POST create" do
    context "with valid credentials" do
      before do
        alice = Fabricate(:user)
        post :create, email: alice.email, password: alice.password

      end
      it "puts the signed in user in the session" do
        alice = Fabricate(:user)
        post :create, email: alice.email, password: alice.password
        expect(session[:user_id]).to eq(alice.id)
      end
      it "redirect to the home page" do
        expect(response).to redirect_to home_path
      end
      it "sets the notice" do
        expect(flash[:notice]).to eq("You are signed in.")
      end

    end

    context "with invalid credentials" do
      before do
        alice = Fabricate(:user)
        post :create, email: alice.email, password: alice.password + "anything"

      end

      it "does not put the signed in user in the session" do
        expect(session[:user_id]).to be_nil
      end

      it "redirect to the sign in page" do
        expect(response).to render_template 'sessions/new'
      end

      it "sets the error message" do
        expect(flash[:error]).to eq("Invalid email or password.")
      end
    end
  end

  describe "GET destroy" do
    before do
      session[:user_id] = Fabricate(:user).id
      get :destroy
    end
    it "destroys the session" do
      expect(session[:user_id]).to be_nil
    end
    it "redirects to the root path" do
      expect(response).to redirect_to root_path
    end
    it "sets the notice" do
      expect(flash[:notice]).to eq("You are signed out.")
    end
  end
end
