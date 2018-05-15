User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar")

10.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(10)
10.times do
  title = Faker::Lorem.sentence(4)
  content = Faker::Lorem.paragraphs(10)
  users.each { |user| user.posts.create!(title: title, content: content) }
end
