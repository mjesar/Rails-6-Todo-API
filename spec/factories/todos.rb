FactoryBot.define do
  factory :todo do
    title { Faker::FunnyName.name }
    description { Faker::Lorem.paragraph(sentence_count: 1) }
    status { false }
  end
end
