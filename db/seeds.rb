User.create!(username:  "Example User",
            description: "I am the first user",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  description = "I am user number #{n}"
  password = "password"
  User.create!(username:  name,
               description: description,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
users.each do |user|
  12.times do |k|
    name = Faker::RickAndMorty.character
    desc = Faker::RickAndMorty.quote
    rating = rand(0..230)
    user.contents.create!(name: name, desc: desc, rating: rating)
  end
end
