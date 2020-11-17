FactoryBot.define do
  factory :stat do
    artist
    hours { rand(1..10) }
    track_name { Faker::Music::Phish.song }
    spotify_track_id { '0C0XlULifJtAgn6ZNCW212' }
  end
end
