FactoryBot.define do
  factory :stat do
    artist
    hours { rand(1..10) }
    day { 'test' }
  end
end
