# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Destroying data
puts("Destroying data")
Comment.destroy_all
Tweet.destroy_all
User.destroy_all
puts("Finish destroying")
# Finish destroying

# Admin
puts "Seed Admin"
admin = User.new(
  username: "admin", 
  name: "admin", 
  email: "admin@mail.com",
  password: "password"
)
if admin.valid?
  admin.avatar.attach(io: File.open("db/img/admin.jpg"), filename: "admin.jpg")
  admin.save
  puts "Admin created"
else
  puts admin.errors.full_messages.join(", ")
end
puts "Finish Admin"


# Start Seeding Users
puts("Start seeding Users")
4.times do |n|
  user = User.new(
    email: "test#{n+1}@mail.com",
    password: "password",
    username: Faker::Internet.unique.username,
    name: "test#{n+1}"
  )
  if user.valid?
    user.avatar.attach(io: File.open("db/img/avatar_default_user.png"), filename: "avatar_default.jpg")
    user.save
    puts "User created"
  else
    puts user.errors.full_messages.join(", ")
  end
end
puts("Finish seeding users")
# End

# Start Seeding Tweets
puts("Start seeding Tweets")
15.times do |n|
  tw = Tweet.new(
    body: Faker::Lorem.paragraph(sentence_count: 5),
    user: User.find((User.first.id)...(User.last.id))
  )
  if tw.valid?
    tw.save
    puts "Tweet created"
  else
    puts tw.errors.full_messages.join(", ")
  end
end
puts("Finish seeding Tweets")
# End

# Start Seeding Comment
puts("Start seeding Comment")
15.times do |n|
  comment = Comment.new(
    user: User.find((User.first.id)...(User.last.id)),
    tweet: Tweet.find((Tweet.first.id)...(Tweet.last.id)),
    body: Faker::Lorem.paragraph(sentence_count: 5)
  )
  if comment.valid?
    comment.save
    puts "Comment created"
  else
    puts comment.errors.full_messages.join(", ")
  end
end
puts("Finish seeding Comment")
# End
