# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "HoangQuan", email: "quanhv@runsystem.net", password: '123456')
if User.count == 1
  100.times do |i|
    User.create(name: "Name #{i+1}", email: "quan#{i}@gmail.com", password: '123456')
  end
end

users = User.order(:created_at).take(6)

50.times do
  content = "Good idea"
  users.each { |user| user.microposts.create!(content: content) }
end

users = User.all
user = users.first
following = users[2..20]
followers = users[20..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }