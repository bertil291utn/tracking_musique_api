FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email(name: name) }
    password_digest { BCrypt::Password.create('g00d_pa$$') }
  end
end
