FactoryBot.define do
  factory :stat do
    artist
    hours { rand(1..10) }
    track_name { Faker::Music::Phish.song }
  end
end
