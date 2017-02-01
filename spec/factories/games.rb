FactoryGirl.define do
  factory :game do
    date Date.new(2012, 1, 1)
    buy_in_amount 20
    season
  end
end
