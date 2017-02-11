require "rails_helper"

RSpec.describe "no active games", type: :feature do
  before do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    @league = create(:league, user: user)
    @season  = @league.seasons.last
  end

  it "has a disabled button on the page" do
    game    = create(:game, season: @season, active: false)
    player1 = create(:player, game: game, finishing_place: 1)
    player2 = create(:player, game: game, finishing_place: 2)
    game.calculate_scores
    visit league_path(@league)
    expect(page).to_not have_link("Score Active Games")
  end

  it "has a disabled button on the page" do
    game = create(:game, season: @season, active: true)
    visit league_path(@league)
    expect(page).to have_link("Score Active Games")

    click_link("Score Active Games")
    expect(current_url).to include(league_games_path(@league, active: true))
  end
end
