# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Creating 5 users..."
5.times do
  User.create(
    address: "#{Faker::Address.street_address} #{Faker::Address.city}",
    username: Faker::Internet.user_name
    )
end
puts "Users created!"

users = User.all
users.each do |u|
  puts "Creating 20 books for #{u.username}..."
  10.times do
    Book.create(
      user_id: u.id,
      title: Faker::Book.title,
      author: Faker::Book.author,
      description: Faker::Dune.quote,
      cover: "https://picsum.photos/200/300?image=#{(1..1000).to_a.sample}"
      )
  end
  puts "20 books created for #{u.username}!"
end
