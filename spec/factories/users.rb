FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email(name: name) }
    password { BCrypt::Password.create('g00d_pa$$') }
  end
end
