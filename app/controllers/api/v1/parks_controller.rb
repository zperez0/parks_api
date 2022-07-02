module Api
  module V1
    class ParksController < ApplicationController
      def index
        @parks = Park.all
        json_response(@parks)
      end

      def show
        @park = Park.find(params[:id])
        json_response(@park)
      end

      def create
        @park = Park.create!(park_params)
        json_response(@park, :created)
      end

      def update
        @park = Park.find(params[:id])
        if @park.update!(park_params)
          render status: 200, json: {
                   message: "This park has been updated successfully.",
                 }
        end
      end

      def destroy
        @park = Park.find(params[:id])
        if @park.destroy!
          render status: 202, json: {
                   message: "This park has been successfully deleted.",
                 }
        end
      end

      private

      def park_params
        params.permit(:name, :longitude, :latitude, :statecode, :animal, :kind, :description)
      end
    end
  end
end
