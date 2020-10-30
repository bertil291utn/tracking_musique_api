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
ids_artists = %w[0oSGxfWSnnOXhD2fKuz2Gy 3dBVyJ7JuOMt4GE9607Qin 1sTsuZTdANkiFd7T34H3nb 4M2gGLzKCo0rPyn224PsoN]
ids_tracks = %w[6wVWJl64yoTzU27EI8ep20 0LoQuiekvzqx7n8flgEKzF 5gOnivVq0hLxPvIPC00ZhF 1y5LL9dpLXbCXNKKqw5wCJ]

5.times do
  name = Faker::Name.name
  user = User.create! name: name, email: Faker::Internet.email(name: name), password: name[0] + '123456'

  ids_artists.each do |elem|
    artist = Artist.create!(
      id_string: elem,
      user_id: user.id,
    )
    rand(1..2).times do
      Stat.create! hours: rand(1..10), track_name: Faker::Music::Phish.song, spotify_track_id: ids_tracks.sample, artist_id: artist.id
    end
  end
end
