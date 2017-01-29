require "rails_helper"

RSpec.describe Season, type: :model do
  it { should belong_to :league }

  it "#display_status - true" do
    season = create(:season)
    expect(season.display_status).to eq("Active!")
  end

  it "#display_status - false" do
    season = create(:season, active: false)
    expect(season.display_status).to eq("Inactive")
  end
end
