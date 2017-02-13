require "Rails_helper"

RSpec.describe "user can add player, finishing place, and additional expense to game" do
  before do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    @league = create(:league, user: user)
    season = @league.seasons.last
    @game = create(:game, season: season)
    @participants = create_list(:participant, 2, user: user)
  end

  it "adds an existing participant as a player" do
    visit league_games_path(@league, active: true)
    click_link "Score Game"

    expect(current_path).to eq(new_game_player_path(@game))
    find('#player_participant_id').find(:xpath, 'option[2]').select_option
    fill_in "Finishing place", with: 9
    fill_in "Additional expense", with: 100

    click_button "Score It!"

    expect(current_path).to eq(new_game_player_path(@game))
    within('.scored') do
      expect(page).to have_content(@participants[0].full_name)
      expect(page).to have_content("9")
      expect(page).to have_content("$100.00")
    end
  end
end
