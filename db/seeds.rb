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
artists = [
  {
    "id": '60d24wfXkVzDSfLS6hyCjZ',
    "name": 'Martin Garrix',
    "photoUrl": 'https://i.scdn.co/image/d5eaed9a6f206fa5caefd42c6b4c7ce93900ae43',
  },
  {
    "id": '6M2wZ9GZgrQXHCFfjv46we',
    "name": 'Dua Lipa',
    "photoUrl": 'https://i.scdn.co/image/44893ea0065579ff145176eab721794b7714640c',
  },
  {
    "id": '1Xyo4u8uXC1ZmMpatF05PJ',
    "name": 'The Weeknd',
    "photoUrl": 'https://i.scdn.co/image/19393c56208fe6c312384879c11ff3da463f1304',
  },
  {
    "id": '7CajNmpbOovFoOoasH2HaY',
    "name": 'Calvin Harris',
    "photoUrl": 'https://i.scdn.co/image/86c5f96479cd660cce7f8c8c84187242e02dba34',
  },
]
p artists[0][:id]
ids_tracks = %w[5Dqik1P9toCJTLj5rEm78s 5LYJ631w9ps5h9tdvac7yP 2Ch7LmS7r2Gy2kc64wv3Bz 0NdTUS4UiNYCNn5FgVqKQY]

3.times do
  name = Faker::Name.name
  user = User.create! name: name, email: Faker::Internet.email(name: name), password: name[0] + '123456'

  artists.each do |elem|
    artist = Artist.create!(
      id_string: elem[:id],
      name: elem[:name],
      photoUrl: elem[:photoUrl],
      user_id: user[:id],
    )
    rand(1..2).times do
      Stat.create! hours: rand(1..10), track_name: Faker::Music::Phish.song, spotify_track_id: ids_tracks.sample, artist_id: artist.id
    end
  end
end
