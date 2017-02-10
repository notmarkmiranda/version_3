require "rails_helper"

RSpec.describe Participant, type: :model do
  context "validations" do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_uniqueness_of(:first_name).scoped_to(:last_name).case_insensitive }
    it { should belong_to :user }
    it { should have_many :players }
  end

  context "methods" do
    it "#full_name" do
      participant = create(:participant, first_name: "John", last_name: "Doe")
      expect(participant.full_name).to eq("John Doe")
    end

    it "#overall_games_count" do
      player1 = create(:player)
      participant = player1.participant
      expect(participant.overall_games_count).to eq(1)

      player2 = create(:player, participant: participant)
      participant.reload
      expect(participant.overall_games_count).to eq(2)
    end

    it "#overall_score" do
      player = create(:player)
      participant = player.participant
      game = player.game
      game.calculate_scores
      player.reload
      expect(participant.overall_score).to eq(0.165)

      player2 = create(:player, participant: participant)
      game2 = player2.game
      game2.calculate_scores
      player2.reload
      expect(participant.overall_score).to eq(0.324)
    end

    it "#overall_won_or_placed_percentage" do
      player1 = create(:player, finishing_place: 1)
      participant = player1.participant
      # expect(participant.overall_won_or_placed_percentage).to eq(100)

      player2 = create(:player, finishing_place: 4, participant: participant)
      participant.reload
      expect(participant.overall_won_or_placed_percentage).to eq(50)

    end

  end
end
