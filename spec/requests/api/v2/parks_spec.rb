require "swagger_helper"

# Patch / Put is not working for Kind. I have tried adding lines 40-43 below to get it to work. I have also added park.id in the paths. I believe since it's an arrary i'm having issues getting it to be able to work.

RSpec.describe "api/v2/parks", type: :request do
  path "/api/v2/parks" do
    get("list parks") do
      response(200, "successful") do
        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true),
            },
          }
        end
        run_test!
      end
    end

    post("create park") do
      response(200, "successful") do
        consumes "application/json"
        parameter name: :params, in: :body, schema: {
                    type: :object,
                    properties: {
                      name: { type: :string },
                      longitude: { type: :integer },
                      latitude: { type: :integer },
                      statecode: { type: :string },
                      animal: { type: :string },
                      description: { type: :string },
                      kind: { type: :array },
                    },
                  }

        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true),
               name: :kind, in: :query, schema: { type: :array }, collectionFormat: collection_format 
              },
            }
            allow(example).to receive(:kind).and_return(['national', 'state'])
        end
        run_test!
      end
    end

    path "/api/v2/parks/{id}" do
      # You'll want to customize the parameter types...
      parameter name: "id", in: :path, type: :string, description: "id"

      get("show park") do
    
        response(200, "successful") do
          let(:id) { park.id }

          after do |example|
            example.metadata[:response][:content] = {
              "application/json" => {
                example: JSON.parse(response.body, symbolize_names: true),
              },
            }
          end
          run_test!
        end
      end

      patch("update park") do
        
        response(200, "successful") do

          let(:id) { park.id }
          parameter name: :params, in: :id, schema: {
                      type: :object,
                      properties: {
                        name: { type: :string },
                        longitude: { type: :integer },
                        latitude: { type: :integer },
                        statecode: { type: :string },
                        animal: { type: :string },
                        description: { type: :string },
                        kind: { type: :string },
                      },
                    }

          after do |example|
            example.metadata[:response][:content] = {
              "application/json" => {
                example: JSON.parse(response.body, symbolize_names: true),
               name: :kind, in: :query, schema: { type: :array }, collectionFormat: collection_format 
              },
            }
            allow(example).to receive(:kind).and_return(['national', 'state'])
          end
          run_test!
        end
      end

      put("update park") do
        
        response(200, "successful") do
         
          let(:id) { park.id }
          parameter name: :params, in: :id, schema: {
                      type: :object,
                      properties: {
                        park: {
                          type: :object,
                          properties: {
                        name: { type: :string },
                        longitude: { type: :integer },
                        latitude: { type: :integer },
                        statecode: { type: :string },
                        animal: { type: :string },
                        description: { type: :string },
                        kind: { type: :string },
                      },
                    }
                  }
                }

          after do |example|
            example.metadata[:response][:content] = {
              "application/json" => {
                example: JSON.parse(response.body, symbolize_names: true),
              },
            }
          end
          run_test!
        end
      end

      delete("delete park") do
        response(200, "successful") do
          let(:id) { park.id }

          after do |example|
            example.metadata[:response][:content] = {
              "application/json" => {
                example: JSON.parse(response.body, symbolize_names: true),
              },
            }
          end
          run_test!
        end
      end
    end
  end
end
