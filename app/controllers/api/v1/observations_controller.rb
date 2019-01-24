module Api::V1
  class ObservationsController < ApplicationController
    before_action :authenticate_user, except: [:index, :show]

    def index
      observations = Observation.all
      render json: ObservationSerializer.new(observations).serialized_json
    end

    def show
      observation = Observation.find(params[:id])
      render json: ObservationSerializer.new(observation).serialized_json
    end

  end
end
