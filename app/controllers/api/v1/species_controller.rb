module Api::V1
  class SpeciesController < ApplicationController
    load_and_authorize_resource

    skip_before_action :authenticate_user, only: [:index, :show]
    before_action :get_species, only: [:show]

    def index
      species = Species.order('name ASC').page(page_param).per(20)
      render json: SpeciesSerializer.new(species).serialized_json
    end

    def show
      render json: SpeciesSerializer.new(@species).serialized_json
    end


    private

      def get_species
        @species = Species.find(params[:id])
      end

  end
end
