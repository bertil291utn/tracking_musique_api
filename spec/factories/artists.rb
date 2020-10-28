FactoryBot.define do
  factory :artist do
    user
    id_string { Faker::Blockchain::Bitcoin.address }
  end
end
