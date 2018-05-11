FactoryBot.define do
  sequence(:email) { |n| "user_#{n}@example.com" }

  factory :post do
    title "MyString"
    content "MyText"
    user
  end

  factory :user do
    name "The dude"
    email
    password "bowling"
  end

end
