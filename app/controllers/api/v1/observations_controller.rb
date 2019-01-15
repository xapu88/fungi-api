module Api::V1
  class ObservationsController < ApplicationController

    def index
      observations = []
      Observation.all.each do |obs|
        observations << ObservationSerializer.new(obs).serialized_json
      end
      render json: observations
    end

  end
end
