module Api::V1
  class ObservationsController < ApplicationController
    load_and_authorize_resource

    skip_before_action :authenticate_user, only: [:index, :show]
    before_action :get_observation, only: [:show, :update, :destroy]

    def index
      observations = Observation.order('created_at DESC').page(page_param).per(20)
      render json: ObservationSerializer.new(observations).serialized_json
    end

    def show
      render json: ObservationSerializer.new(@observation).serialized_json
    end

    def create
      observation = Observation.new(observation_params)
      observation.legator = @current_user if @current_user.present?
      observation.habitat = observation.create_habitat(params[:habitat_category_id], params[:habitat_note], params[:habitat_species_ids])
      if observation.save
        render json: ObservationSerializer.new(observation).serialized_json, status: 200
      else
        render json: { errors: observation.errors }, status: 422
      end
    end

    def update
      if @observation.update(observation_params)
        render json: ObservationSerializer.new(@observation).serialized_json, status: 200
      else
        render json: { errors: @observation.errors }, status: 422
      end
    end

    def destroy
      @observation.destroy
      head :ok
    end


    private

      def get_observation
        @observation = Observation.find(params[:id])
      end

      def observation_params
        params.require(:observation).permit(:description, :area, :location, :longitude, :latitude, :altitude, :quantity, :explored_surface, :sample, :external_url, :approved, :observed_at, :species_id)
      end

  end
end
