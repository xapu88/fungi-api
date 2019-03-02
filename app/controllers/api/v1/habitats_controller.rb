module Api::V1
  class HabitatsController < ApplicationController
    skip_before_action :authenticate_user, only: [:show]
    before_action :get_habitat, only: [:show]

    def show
      render json: HabitatSerializer.new(@habitat).serialized_json
    end

    private

      def get_habitat
        @habitat = Habitat.find(params[:id])
      end
  end
end
