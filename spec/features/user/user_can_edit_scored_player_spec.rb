require "rails_helper"

RSpec.describe "User can edit a scored player" do
  before do
    @game = create(:game)
    user = User.last
    participant = create(:participant, user: user)
    @player = create(:player, game: @game)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  it "place can be changed" do
    visit new_game_player_path(@game)

    within('.scored') do
      click_link "Edit #{@player.full_name}"
    end

    expect(current_)
  end

  it "additional expense can be changed"
  it "place and additional expense can be changed"
end
