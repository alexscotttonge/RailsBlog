FactoryBot.define do
  factory :post do
    title "MyString"
    content "MyText"
    user
  end

  factory :user do
    name "The dude"
    email "dudes@abides.org"
    password "bowling"
  end

end
