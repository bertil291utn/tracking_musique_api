FactoryBot.define do
  days = %w[monday tuesday wednesday thursday friday saturday sunday]
  factory :stat do
    artist
    hours { rand(1..10) }
    day { days.sample }
  end
end
