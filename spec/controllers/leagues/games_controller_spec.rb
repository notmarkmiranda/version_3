require "rails_helper"

RSpec.describe Leagues::GamesController, type: :controller do
  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(User.last)
  end

  xit "POST create" do
    season = create(:season)
    attrs = attributes_for(:game, season_id: season.id)

    post :create, params: { id: League.last.slug, game: attrs }
    expect(response).to redirect_to(dashboard_path)
  end
end
