# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |n|
  email = Faker::Internet.email
  password = "password"
  name = Faker::Name.name
  uid = Faker::Twitter.status
  provider = Faker::Twitter.status
  avatar = Faker::Avatar.image
  image_url = Faker::Avatar.image
  user = User.create!(email: email,
               password: password,
               password_confirmation: password,
               name: name,
               uid: uid,
               provider: provider,
               avatar: avatar,
               image_url: image_url
               )
   topic = Topic.create(title: "あああ",
                content: "hoge",
                user_id: user.id
               )
    Comment.create(content: "sss",
                   user_id: user.id,
                   topic_id: topic.id
                   )
  end
