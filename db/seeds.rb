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
  scores = [
    { name: 'nakai', subject: 'English', score: '65' },
    { name: 'nakai', subject: 'Math', score: '70' },
    { name: 'nakai', subject: 'Science', score: '40' },
    { name: 'nakai', subject: 'Music', score: '95' },
    { name: 'kimura', subject: 'English', score: '55' },
    { name: 'kimura', subject: 'Math', score: '65' },
    { name: 'kimura', subject: 'Science', score: '75' },
    { name: 'kimura', subject: 'Music', score: '60' },
    { name: 'kusanagi', subject: 'English', score: '50' },
    { name: 'kusanagi', subject: 'Math', score: '90' },
    { name: 'kusanagi', subject: 'Science', score: '85' },
    { name: 'kusanagi', subject: 'Music', score: '75' },
    { name: 'inagaki', subject: 'English', score: '30' },
    { name: 'inagaki', subject: 'Math', score: '90' },
    { name: 'inagaki', subject: 'Science', score: '90' },
    { name: 'inagaki', subject: 'Music', score: '80' },
    { name: 'katori', subject: 'English', score: '40' },
    { name: 'katori', subject: 'Math', score: '80' },
    { name: 'katori', subject: 'Science', score: '75' },
    { name: 'katori', subject: 'Music', score: '75' }
  ]
  Score.create! scores
