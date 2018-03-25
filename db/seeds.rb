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
