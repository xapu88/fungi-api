module Api::V1
  class HabitatCategoriesController < ApplicationController
    load_and_authorize_resource

    skip_before_action :authenticate_user, only: [:index]
    before_action :get_category, only: [:show, :update, :destroy]

    def index
      categories = HabitatCategory.all
      render json: HabitatCategorySerializer.new(categories).serialized_json
    end

    def show
      render json: HabitatCategorySerializer.new(@category).serialized_json
    end

    def create
      category = HabitatCategory.new(habitat_category_params)
      if category.save
        render json: HabitatCategorySerializer.new(category).serialized_json, status: 200
      else
        render json: { errors: category.errors }, status: 422
      end
    end

    def update
      if @category.update(habitat_category_params)
        render json: HabitatCategorySerializer.new(@category).serialized_json, status: 200
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
        @category = HabitatCategory.find(params[:id])
      end

      def habitat_category_params
        params.require(:habitat_category).permit(:name, :floral_species_ids)
      end

  end
end
