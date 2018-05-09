require 'rails_helper'

RSpec.describe HomePageController, type: :controller do
  it "loads home page successfully" do
    get :index

    expect(response).to have_http_status(200)
  end

end
