module Api::V1
  class SubstrateCategoriesController < ApplicationController
    load_and_authorize_resource

    skip_before_action :authenticate_user, only: [:index]
    before_action :get_category, only: [:show, :update, :destroy]

    def index
      categories = SubstrateCategory.all
      render json: SubstrateCategorySerializer.new(categories).serialized_json
    end

    def show
      render json: SubstrateCategorySerializer.new(@category).serialized_json
    end

    def create
      category = SubstrateCategory.new(substrate_category_params)
      if category.save
        render json: SubstrateCategorySerializer.new(category).serialized_json, status: 200
      else
        render json: { errors: category.errors }, status: 422
      end
    end

    def update
      if @category.update(substrate_category_params)
        render json: SubstrateCategorySerializer.new(@category).serialized_json, status: 200
      else
        render json: { errors: @category.errors }, status: 422
      end
    end

    def destroy
      @category.destroy
      head :ok
    end

    private

      def get_category
        @category = SubstrateCategory.find(params[:id])
      end

      def substrate_category_params
        params.require(:substrate_category).permit(:name, :floral_species_ids)
      end

  end
end
