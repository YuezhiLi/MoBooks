# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Event.delete_all
Book.delete_all
User.delete_all

puts "Creating 5 users..."
5.times do
  User.create(
    # address: "#{Faker::Address.street_address} #{Faker::Address.city}",
    nickName: Faker::Internet.user_name,
    contact: Faker::Internet.email
    # open_id: Faker::Number.between(1..1000)
    )
end
puts "Users created!"

users = User.all
users.each do |u|
  puts "Creating 5 books for #{u.nickName}..."
  5.times do
    Book.create(
      user_id: u.id,
      title: Faker::Book.title,
      author: Faker::Book.author,
      description: Faker::Dune.quote,
      remote_cover_url: "https://picsum.photos/400/600?image=#{(1..10).to_a.sample}"
      )
  end
  puts "5 books created for #{u.nickName}!"
end

user = User.last
book1 = Book.last
book2 = Book.first
Event.create(user: user, book: book1)
Event.create(user: user, book: book2)
puts "the last user borrowed 2 books!"
