User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar")

1.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(1)
1.times do
  title = Faker::Lorem.sentence(4)
  content = Faker::Lorem.paragraphs(2)
  users.each { |user| user.posts.create!(title: title, content: content) }
end
