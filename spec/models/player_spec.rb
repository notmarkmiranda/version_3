require "rails_helper"

RSpec.describe Player, type: :model do
  context "validations" do
    it { should belong_to :game }
    it { should belong_to :participant }
  end
end
