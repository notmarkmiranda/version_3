require "rails_helper"

RSpec.describe Game, type: :model do
  context "validations" do
    it { should belong_to :season}
    it { should validate_presence_of :date }
    it { should validate_presence_of :buy_in_amount }
    it { should validate_presence_of :season_id }
  end

  context "methods" do
    before do
      @game = create(:game)
    end

    it "#active_status - Active" do
      expect(@game.active_status).to eq("Active")
    end

    it "#active_status - Scored" do
      @game.update(active: false)
      expect(@game.reload.active_status).to eq("Scored")
    end

    it "#full_date" do
      expect(@game.full_date).to eq("January 1, 2012")
    end
  end

  context "scoring" do
    before do
      @game = create(:game)
      create_list(:player, 10, game: @game)
      @first = Player.first
      @last = Player.last
    end

    it "#calculate_scores" do
      @game.calculate_scores
      @first.reload
      @last.reload
      expect(@first.score).to eq(7.07)
      expect(@last.score).to eq(1.28)
    end
  end
end
