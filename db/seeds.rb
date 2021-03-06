User.create!(username:  "Peter1403",
            description: "I am the first user",
             password:              "foobar",
             password_confirmation: "foobar",
             profile_picture: File.open(Rails.root + "app/assets/images/profilepic1.jpeg"),
             admin: true)

User.create!(username:  "Admin User First",
            description: "I am the second user",
              password:              "foobar",
              password_confirmation: "foobar",
              profile_picture: File.open(Rails.root + "app/assets/images/profilepic2.jpeg"),
              admin: true)

User.create!(username:  "Admin User Second",
            description: "I am the third user",
            password:              "foobar",
            password_confirmation: "foobar",
            profile_picture: File.open(Rails.root + "app/assets/images/profilepic3.jpeg"),
            admin: true)

30.times do |n|
  name  = Faker::Name.first_name
  description = "I am user number #{n+4}"
  password = "password"
  User.create!(username:  name,
               description: description,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
users.each do |user|
  3.times do |k|
    name = Faker::Science.element
    desc = Faker::Lorem.sentence(3)
    pic = File.open(Rails.root + "app/assets/images/contentpic#{rand(1..10)}.jpg")
    user.contents.create!(name: name, desc: desc, picture: pic)
    20.times do |z|
      content = Faker::Lorem.sentence(5)
      Content.find(k+1).comments.create!(content_text: content,
         user_id: user.id)
    end
  end
end


# Following relationships
users = User.all
user  = users.first
following = users[2..30]
followers = users[3..20]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
