require "rails_helper"

RSpec.describe SessionsController, type: :controller do
  it "GET destroy" do
    get :destroy
    expect(response).to redirect_to(root_path)
  end
end
