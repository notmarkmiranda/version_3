FactoryGirl.define do
  factory :player do
    participant
    sequence :finishing_place do |x|
      x
    end
    game
    additional_expense 0
  end
end
