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
    before(:all) do
      @game = create(:game)
      create_list(:player, 10, game: @game)
      @first = Player.first
      @last = Player.last
    end

    it "#calculate_scores" do
      @game.calculate_scores
      @first.reload
      @last.reload
      expect(@first.score).to eq(7.071)
      expect(@last.score).to eq(1.285)
    end

    it "#player_count" do
      expect(@game.player_count).to eq(10)
    end

    it "#pot" do
      expect(@game.pot).to eq(200)
      @last.update(additional_expense: 15)
      expect(@game.pot).to eq(215)
    end

    it "#first_or" do
      first_place = @game.players.where(finishing_place: 1).first
      expect(@game.first_or).to eq(first_place.participant)
    end
  end
end
