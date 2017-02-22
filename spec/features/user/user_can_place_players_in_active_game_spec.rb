require "rails_helper"

RSpec.describe "User can score a game", type: :feature do
  it "allows user to add finishing place to an active game" do
    game = create(:game)
    user = User.last
    participant1, participant2 = create_list(:participant, 2, user: user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_game_player_path(game)

    select participant1.full_name, from: "player_participant_id"
    fill_in "Finishing place", with: 2
    fill_in "Additional expense", with: 100
    click_button "Score It!"

    within(".scored") do
      expect(page).to have_content(participant1.full_name)
      expect(page).to have_content("Place: 2")
      expect(page).to have_content("Total Cost: $120.00")
    end
  end
end
