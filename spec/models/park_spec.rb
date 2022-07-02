require 'rails_helper'

describe Park do
  it { should validate_presence_of :name }
  it { should validate_presence_of :longitude }
  it { should validate_presence_of :latitude }
  it { should validate_presence_of :statecode }
  it { should validate_presence_of :animal }
  it { should validate_inclusion_of(:kind).in_array(['national', 'state']) }
  it { should validate_presence_of :description }
end

describe Park do
  it("titleizes the name of a park")do
    park = Park.create!({name: "forest", longitude: 123, latitude: 456, statecode: "FL", animal: "test_animal", kind: "state", description: "test_description" })
    expect(park.name).to eq "Forest"
  end
end