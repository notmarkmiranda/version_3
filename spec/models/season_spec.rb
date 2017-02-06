require "rails_helper"

RSpec.describe Season, type: :model do
  it { should belong_to :league }
  it { should have_many :games }

  it "#display_status - true" do
    season = create(:season)
    expect(season.display_status).to eq("Active!")
  end

  it "#display_status - false" do
    season = create(:season, active: false)
    expect(season.display_status).to eq("Inactive")
  end

  it "#current_season" do
    user = create(:user)
    league = create(:league, user: user)
    first_season = Season.first
    second_season = create(:season, league: league, active: false)
    expect(Season.current_season(user.id, league.id)).to eq(first_season)
  end
end
