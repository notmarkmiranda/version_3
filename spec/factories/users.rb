FactoryGirl.define do
  factory :user do
    sequence :email do |x|
      "a#{x}@b.com"
    end
    password "password"
  end
end
