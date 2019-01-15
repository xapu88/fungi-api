module Api::V1
  class ObservationsController < ApplicationController

    def index
      @observations = Observation.all
      render json: @observations
    end
    
  end
end
