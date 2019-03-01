module Api::V1
  class FloralSpeciesController < ApplicationController
    load_and_authorize_resource

    skip_before_action :authenticate_user, only: [:index, :show]
    before_action :get_species, only: [:show, :update, :destroy]

    def index
      species = FloralSpecies.all
      render json: FloralSpeciesSerializer.new(species).serialized_json
    end

    def show
      render json: FloralSpeciesSerializer.new(@species).serialized_json
    end

    def create
      species = FloralSpecies.new(floral_species_params)
      if species.save
        render json: FloralSpeciesSerializer.new(species).serialized_json, status: 200
      else
        render json: { errors: species.errors }, status: 422
      end
    end

    def update
      if @species.update(floral_species_params)
        render json: FloralSpeciesSerializer.new(@species).serialized_json, status: 200
      else
        render json: { errors: @species.errors }, status: 422
      end
    end

    def destroy
      @species.destroy
      head :ok
    end


    private

      def floral_species_params
        params.require(:floral_species).permit(:name, :latin_name)
      end

      def get_species
        @species = FloralSpecies.find(params[:id])
      end
  end
end
