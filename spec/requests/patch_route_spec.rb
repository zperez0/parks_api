require "rails_helper"

describe "edit a park route", type: :request do
  before do
    @park = Park.create!(name: "test_name", longitude: 123, latitude: 456, statecode: "FL", animal: "test_animal", kind: "state", description: "test_description")
    patch "/parks/#{@park.id}", params: { name: "new_name", longitude: 567, latitude: 612, statecode: "WA", animal: "new_animal", kind: "national", description: "new_description" }
  end

  it "updates the parks name, longitude, latitude, statecode, animal, kind, description" do
    get "/parks/#{@park.id}"
    expect(JSON.parse(response.body)["name"]).to eq("new_name")
    expect(JSON.parse(response.body)["longitude"]).to eq(567)
    expect(JSON.parse(response.body)["latitude"]).to eq(612)
    expect(JSON.parse(response.body)["statecode"]).to eq("WA")
    expect(JSON.parse(response.body)["animal"]).to eq("new_animal")
    expect(JSON.parse(response.body)["kind"]).to eq("national")
    expect(JSON.parse(response.body)["description"]).to eq("new_description")
  end

  it "returns a updated status" do
    expect(response).to have_http_status(:ok)
  end
end

describe "exceptions work as expected", type: :request do
  it "throws error if name longitude, latitude, statecode, animal,kind, description field is empty" do
    @park = Park.create!(name: "test_name", longitude: 123, latitude: 456, statecode: "FL", animal: "test_animal", kind: "state", description: "test_description")
    patch "/parks/#{@park.id}", params: { name: "", statecode: "", animal: "", kind: "", description: "" }
    expect(response).to have_http_status(422)
    expect(JSON.parse(response.body)["message"]).to eq("Validation failed: Name can't be blank, Statecode can't be blank, Animal can't be blank, Description can't be blank, Kind is not included in the list")
  end
end
