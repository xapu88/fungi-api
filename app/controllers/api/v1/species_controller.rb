module Api::V1
  class SpeciesController < ApplicationController
    load_and_authorize_resource

    skip_before_action :authenticate_user, only: [:index, :search, :show]
    before_action :get_species, only: [:show, :update, :destroy]

    def index
      if params[:page].present?
        species = Species.order('name ASC').page(page_param).per(50)
      else
        species = Species.order('name ASC')
      end
      render json: SpeciesSerializer.new(species).serialized_json
    end

    def search
      species = Species.where("name LIKE ?", "%#{params[:q]}%")
      render json: SpeciesSerializer.new(species).serialized_json
    end

    def show
      render json: SpeciesSerializer.new(@species).serialized_json
    end

    def create
      species = Species.new(species_params)
      if species.save
        render json: SpeciesSerializer.new(species).serialized_json, status: 200
      else
        render json: { errors: species.errors }, status: 422
      end
    end

    def update
      if @species.update(species_params)
        render json: SpeciesSerializer.new(@species).serialized_json, status: 200
      else
        render json: { errors: @species.errors }, status: 422
      end
    end

    def destroy
      @species.destroy
      head :ok
    end


    private

      def species_params
        params.require(:species).permit(:name, :description, :genus, :familia, :ordo, :subclassis, :classis, :subphylum, :phylum, :edible, :cultivated, :poisonous, :medicinal)
      end

      def get_species
        @species = Species.find(params[:id])
      end

  end
end
