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