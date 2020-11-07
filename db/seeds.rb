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
ids_artists = %w[60d24wfXkVzDSfLS6hyCjZ 6M2wZ9GZgrQXHCFfjv46we 1Xyo4u8uXC1ZmMpatF05PJ 7CajNmpbOovFoOoasH2HaY]
ids_tracks = %w[5Dqik1P9toCJTLj5rEm78s 5LYJ631w9ps5h9tdvac7yP 2Ch7LmS7r2Gy2kc64wv3Bz 0NdTUS4UiNYCNn5FgVqKQY]

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
