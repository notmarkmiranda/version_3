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

    it "#biggest_game - no players" do
      first_game = create(:game, season: @season)
      second_game = create(:game, season: @season, buy_in_amount: 100)
      expect(@league.biggest_game).to eq(second_game)

      first_game.update(buy_in_amount: 1000)
      @league.reload
      expect(@league.biggest_game).to eq(first_game)
    end

    it "#biggest_game - with players" do
      first_game  = create(:game, season: @season)
      second_game = create(:game, season: @season, buy_in_amount: 21)
      player = create(:player, game: second_game)
      expect(@league.biggest_game).to eq(second_game)
    end

    it "#completed_games_count" do
      first_game  = create(:game, season: @season)
      second_game = create(:game, season: @season, active: false)
      expect(@league.completed_games_count).to eq(1)
      first_game.update(active: false)
      @league.reload
      expect(@league.completed_games_count).to eq(2)
    end

    it "#cumulative_pot" do
      first_game    = create(:game, season: @season)
      second_game   = create(:game, season: @season, buy_in_amount: 21)
      first_player  = create(:player, game: second_game)
      second_player = create(:player, game: first_game, additional_expense: 100)
      expect(@league.cumulative_pot).to eq(141)
    end

    it "#games_count" do
      expect(@league.games_count).to eq(0)
      create(:game, season: @season, active: false)
      expect(@league.games_count).to eq(1)
      create(:game, season: @season)
      expect(@league.games_count).to eq(2)
    end

    it "#last_game - no games" do
      expect(@league.last_game).to eq("No Game Available")
    end

    it "#last_game" do
      game = create(:game, season: @season)
      expect(@league.last_game).to eq("January  1, 2012")
    end

    it "#max_pot - empty" do
      expect(@league.max_pot).to eq(0)
    end

    it "#max_pot - 1 game, no players" do
      game = create(:game, season: @season)
      expect(@league.max_pot).to eq(0)
    end

    it "#max_pot - 1 game, 2 players" do
      game    = create(:game, season: @season)
      player1 = create(:player, game: game)
      player2 = create(:player, game: game, additional_expense: 1)
      expect(@league.max_pot).to eq(41)
    end

    it "#max_pot - 2 games, 3 players" do
      first_game    = create(:game, season: @season)
      second_game   = create(:game, season: @season, buy_in_amount: 15)
      first_player  = create(:player, game: first_game)
      second_player = create(:player, game: second_game)
      third_player  = create(:player, game: second_game)
      expect(@league.max_pot).to eq(30)
    end

    it "#overall_leader && #overall_loser" do
      game = create(:game, season: @season)
      player1, player2 = create_list(:player, 2, game: game)
      game.calculate_scores
      player1.reload
      player2.reload
      expect(@league.overall_leader).to eq(player1.participant)
      expect(@league.overall_loser).to eq(player2.participant)
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

    it "#unique_players" do
      expect(@league.unique_players).to eq(0)
      game1, game2 = create_list(:game, 2, season: @season)
      player1, player2 = create_list(:player, 2, game: game1)
      player3 = create(:player, participant: player1.participant, game: game2)

      @league.reload
      expect(@league.unique_players).to eq(2)
    end

    it "#slug_creation" do
      expect(@league.slug_creation).to eq(true)
    end
  end
  
end
