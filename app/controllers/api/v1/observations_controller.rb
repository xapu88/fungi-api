module Api::V1
  class ObservationsController < ApplicationController
    skip_before_action :authenticate_user, only: [:index, :show]

    def index
      observations = Observation.all
      render json: ObservationSerializer.new(observations).serialized_json
    end

    def show
      observation = Observation.find(params[:id])
      render json: ObservationSerializer.new(observation).serialized_json
    end

    def create
      observation = Observation.new(observation_params)
      observation.legator = current_user
      if observation.save
        render json: ObservationSerializer.new(observation).serialized_json, status: 200
      else
        render json: { errors: observation.errors }, status: 422
      end
    end

    private

    def observation_params
      params.require(:observation).permit(:description, :area, :location, :longitude, :latitude, :altitude, :quantity, :explored_surface, :sample, :external_url, :approved, :observed_at, :species_id, :habitat_id, :substrate_id)
    end

  end
end
