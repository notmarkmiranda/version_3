require "rails_helper"

RSpec.describe League, typ: :model do
  context "validations" do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
    it { should validate_presence_of :slug }
    it { should validate_uniqueness_of :slug }
    it { should validate_presence_of :user_id }
    it { should belong_to  :user }
    it { should have_many :seasons }
  end

  context "methods" do
    before do
      @league = create(:league)
      @season = @league.seasons.first
    end

    it "#active_games_count - 0" do
      expect(@league.active_games_count).to eq(0)
    end

    it "#active_games_count - 1" do
      create(:game, season: @season)
      expect(@league.active_games_count).to eq(1)
    end

    it "#active_games_count - 2" do
      create(:game, season: @season)
      create(:game, season: @season)
      expect(@league.active_games_count).to eq(2)
      create(:game, season: @season, active: false)
      expect(@league.active_games_count).to eq(2)
    end

    it "#games_count" do
      expect(@league.games_count).to eq(0)
      create(:game, season: @season, active: false)
      expect(@league.games_count).to eq(1)
      create(:game, season: @season)
      expect(@league.games_count).to eq(2)
    end

    it "#seasons_count" do
      expect(@league.seasons_count).to eq(1)
    end

    it "#seasons_count - more than 1" do
      create(:season, league: @league)
      expect(@league.seasons_count).to eq(2)
    end

    it "self#find_by_slug" do
      league = create(:league, name: "mark's league", slug: "mark-s-league")
      expect(League.find_by_slug("mark-s-league")).to eq(league)
    end

    it "#to_param" do
      league = create(:league, name: "mark's league")
      expect(league.to_param).to eq("mark-s-league")
    end

    it "#slug_creation" do
      expect(@league.slug_creation).to eq(true)
    end
  end
end
