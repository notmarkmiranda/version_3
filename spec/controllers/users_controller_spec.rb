require "rails_helper"

RSpec.describe UsersController, type: :controller do
  it "GET new - template" do
    get :new
    expect(response).to render_template(:new)
  end

  it "GET show - template" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    get :show, params: { id: user.id }
    expect(response).to render_template(:show)
  end

  it "POST create - happy template" do
    attrs = attributes_for(:user)
    post :create, params: { user: attrs }
    expect(response).to redirect_to(dashboard_path)
  end

  it "POST create - sad template" do
    user = create(:user)
    post :create, params: { user: { email: user.email, password: "wrong" } }
    expect(response).to render_template(:new)
  end
end
