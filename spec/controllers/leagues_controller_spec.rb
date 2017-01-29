require "rails_helper"

RSpec.describe LeaguesController, type: :controller do
  before do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it "GET show - template" do
    league = create(:league, user: @user)
    get :show, params: { id: league.slug }
    expect(response).to render_template(:show)
  end

  it "GET show - assigns" do
    league = create(:league, user: @user)
    get :show, params: { id: league.slug }
    expect(assigns[:league]).to eq(league)
  end

  it "GET new - template" do
    get :new
    expect(response).to render_template(:new)
  end

  it "POST create - happy template" do
    attrs = attributes_for(:league)
    post :create, params: { league: attrs }
    expect(response).to redirect_to(dashboard_path)
  end

  it "POST create - sad template" do
    attrs = attributes_for(:league, name: "")
    post :create, params: { league: attrs }
    expect(response).to render_template(:new)
  end

end
