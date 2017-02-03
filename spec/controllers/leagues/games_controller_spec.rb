require "rails_helper"

RSpec.describe Leagues::GamesController, type: :controller do
  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(User.last)
  end

  it "POST create - template" do
    season = create(:season)
    attrs = attributes_for(:game, season_id: season.id)
    post :create, params: { league_id: League.last.to_param, game: attrs }
    expect(response).to redirect_to(dashboard_path)
  end

  it "POST create - change count" do
    season = create(:season)
    attrs = attributes_for(:game, season_id: season.id)
    expect {
      post :create, params: { league_id: League.last.to_param, game: attrs }
    }.to change(Game, :count).by(1)
  end
end
