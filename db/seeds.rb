# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Stat.delete_all
Artist.delete_all
User.delete_all
ids = %w[003vvx7Niy0yvhvHt4a68B 0C0XlULifJtAgn6ZNCW2eu 1sTsuZTdANkiFd7T34H3nb 7cX4PJz1old9fyFI8RlfgW]

5.times do
  name = Faker::Name.name
  user = User.create! name: name, email: Faker::Internet.email(name: name), password: name[0] + '123456'

  ids.each do |elem|
    artist = Artist.create!(
      id_string: elem,
      user_id: user.id,
    )
    2.times do
      Stat.create! hours: rand(1..10), track_name: Faker::Music::Phish.song, artist_id: artist.id
    end
  end
end
