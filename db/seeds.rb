# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

class Seed
  def self.begin
    seed = Seed.new
    seed.generate_parks
  end

  def generate_parks
    20.times do |i|
      type_of = ["national", "state"]
      park = Park.create!(
        name: Faker::Games::Pokemon.move,
        longitude: Faker::Address.longitude,
        latitude: Faker::Address.latitude,
        statecode: Faker::Address.state,
        animal: Faker::Games::Pokemon.name,
        type: type_of.sample,
        description: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4),
      )
      puts " Park #{i}: Name is #{park.name}, Longitude is #{park.longitude}, Latitude is #{park.latitude}, State is #{park.state}, Animal is #{park.animal}, and Type is #{park.type}, Description is #{park.description}"
    end
  end
end

Seed.begin
