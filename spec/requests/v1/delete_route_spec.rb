require "rails_helper"

describe "delete a park route", type: :request do
  before do
    @park = Park.create!(name: "test_name", longitude: 123, latitude: 456, statecode: "FL", animal: "test_animal", kind: "state", description: "test_description")
    delete "/api/v1/parks/#{@park.id}", params: { name: "test_name", longitude: 123, latitude: 456, statecode: "FL", animal: "test_animal", kind: "state", description: "test_description" }
  end

  it "deletes the park" do
    expect(response).to have_http_status(202)
    expect(JSON.parse(response.body)["message"]).to eq("This park has been successfully deleted.")
  end
end