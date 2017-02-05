require "rails_helper"

RSpec.describe Leagues::GamesController, type: :controller do
  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(User.last)
  end

  it "GET index - template" do
    league = create(:league)
    get :index, params: { league_id: league.slug }
    expect(response).to render_template(:index)
  end

  it "GET index - assigns" do
    league = create(:league)
    season = league.seasons.first
    game = create(:game, season: season)
    get :index, params: { league_id: league.slug }
    expect(assigns[:games]).to eq([game])
  end

  it "POST create - template" do
    season = create(:season)
    attrs = attributes_for(:game, season_id: season.id)
    post :create, params: { league_id: League.last.to_param, game: attrs }
    expect(response).to redirect_to(league_path(League.last))
  end

  it "POST create - change count" do
    season = create(:season)
    attrs = attributes_for(:game, season_id: season.id)
    expect {
      post :create, params: { league_id: League.last.to_param, game: attrs }
    }.to change(Game, :count).by(1)
  end
end
