FactoryBot.define do
  factory :todo do
    title { Faker::FunnyName.name }
    description { Faker::Lorem.paragraph(sentence_count: 2) }
    status { false }
  end
end
