require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    context "when password is invalid" do
      it "renders the page with an error" do
        user = create :user

        post :create, params: { session: { email: user.email, password: "" } }

        expect(response).to render_template(:new)
        expect(flash[:danger]).to match(/Invalid email\/password combination/)
      end
    end

    context "when the login details are correct" do
      it "renders the users details" do
        user = create :user

        post :create, params: { session: { email: user.email, password: user.password } }

        expect(response).to redirect_to user
      end
    end
  end

end
