require "rails_helper"

RSpec.describe League, typ: :model do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should validate_presence_of :slug }
  it { should validate_uniqueness_of :slug }
  it { should validate_presence_of :user_id }
  it { should belong_to  :user }
  it { should have_many :seasons }

  it "#seasons_count" do
    league = create(:league)
    expect(league.seasons_count).to eq(1)
  end

  it "#seasons_count - more than 1" do
    league = create(:league)
    create(:season, league: league)
    expect(league.seasons_count).to eq(2)
  end
end

