FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name} #.nicknameだとエラーになる
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end
