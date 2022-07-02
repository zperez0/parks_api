require "rails_helper"

describe "post a park route", type: :request do
  before do
    post "/api/v2/parks", params: { name: "test_name", longitude: 123, latitude: 456, statecode: "FL", animal: "test_animal", kind: "state", description: "test_description" }
  end

  it "returns the park name" do
    expect(JSON.parse(response.body)["name"]).to eq("test_name")
  end

  it "returns the longitude" do
    expect(JSON.parse(response.body)["longitude"]).to eq(123)
  end

  it "returns the latitude" do
    expect(JSON.parse(response.body)["latitude"]).to eq(456)
  end

  it "returns the statecode" do
    expect(JSON.parse(response.body)["statecode"]).to eq("FL")
  end

  it "returns the animal" do
    expect(JSON.parse(response.body)["animal"]).to eq("test_animal")
  end

  it "returns the kind" do
    expect(JSON.parse(response.body)["kind"]).to eq("state")
  end

  it "returns the description" do
    expect(JSON.parse(response.body)["description"]).to eq("test_description")
  end

  it "returns a created status" do
    expect(response).to have_http_status(:created)
  end
end

describe "expections work as expected", type: :request do
  it "throws error if name field is empty" do
    post "/api/v2/parks", params: { name: "", longitude: 123, latitude: 456, statecode: "FL", animal: "test_animal", kind: "state", description: "test_description" }
    expect(response).to have_http_status(422)
    expect(JSON.parse(response.body)["message"]).to eq("Validation failed: Name can't be blank")
  end

  it "throws error if longitude field is empty" do
    post "/api/v2/parks", params: { name: "test_name", latitude: 456, statecode: "FL", animal: "test_animal", kind: "state", description: "test_description" }
    expect(response).to have_http_status(422)
    expect(JSON.parse(response.body)["message"]).to eq("Validation failed: Longitude can't be blank")
  end

  it "throws error if latitude field is empty" do
    post "/api/v2/parks", params: { name: "test_name", longitude: 123, statecode: "FL", animal: "test_animal", kind: "state", description: "test_description" }
    expect(response).to have_http_status(422)
    expect(JSON.parse(response.body)["message"]).to eq("Validation failed: Latitude can't be blank")
  end

  it "throws error if statecode field is empty" do
    post "/api/v2/parks", params: { name: "test_name", longitude: 123, latitude: 456, statecode: "", animal: "test_animal", kind: "state", description: "test_description" }
    expect(response).to have_http_status(422)
    expect(JSON.parse(response.body)["message"]).to eq("Validation failed: Statecode can't be blank")
  end

  it "throws error if animal field is empty" do
    post "/api/v2/parks", params: { name: "test_name", longitude: 123, latitude: 456, statecode: "FL", animal: "", kind: "state", description: "test_description" }
    expect(response).to have_http_status(422)
    expect(JSON.parse(response.body)["message"]).to eq("Validation failed: Animal can't be blank")
  end

  it "throws error if kind field is empty" do
    post "/api/v2/parks", params: { name: "test_name", longitude: 123, latitude: 456, statecode: "FL", animal: "test_animal", kind: "", description: "test_description" }
    expect(response).to have_http_status(422)
    expect(JSON.parse(response.body)["message"]).to eq("Validation failed: Kind is not included in the list")
  end

  it "throws error if description field is empty" do
    post "/api/v2/parks", params: { name: "test_name", longitude: 123, latitude: 456, statecode: "FL", animal: "test_animal", kind: "state", description: "" }
    expect(response).to have_http_status(422)
    expect(JSON.parse(response.body)["message"]).to eq("Validation failed: Description can't be blank")
  end
end
