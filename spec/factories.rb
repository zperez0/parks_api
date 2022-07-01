FactoryBot.define do
  factory(:park) do
    park_type = ["national", "state"]
    name { Faker::Games::Pokemon.move }
    longitude { Faker::Address.longitude }
    latitude { Faker::Address.latitude }
    statecode { Faker::Address.state_abbr }
    animal { Faker::Games::Pokemon.name }
    kind { park_type.sample }
    description { Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4) }
  end
end
