FactoryBot.define do
  factory :user do
    username { Faker::Internet.username(specifier: 10) }
    password { Faker::Internet.password(
      min_length: 10, 
      max_length: 20, 
      mix_case: true, 
      special_characters: true) }
    email { Faker::Internet.email}
  end
end
