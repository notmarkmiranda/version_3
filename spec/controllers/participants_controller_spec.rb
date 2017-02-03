require "rails_helper"

RSpec.describe ParticipantsController, type: :controller do
  before do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  it "POST create - template/happy" do
    attrs = attributes_for(:participant)
    post :create, params: { participant: attrs }
    expect(response).to redirect_to(dashboard_path)
  end

  it "POST create - change count" do
    attrs = attributes_for(:participant)
    expect {
      post :create, params: { participant: attrs }
    }.to change(Participant, :count).by(1)
  end

  it "POST create - template/sad" do
    attrs = { first_name: "Mark" }
    post :create, params: { participant: attrs }
    expect(response).to redirect_to(dashboard_path)
  end

  it "POST create - not change count" do
    attrs = { first_name: "Mark" }
    expect {
      post :create, params: { participant: attrs }
    }.to change(Participant, :count).by(0)
  end
end
