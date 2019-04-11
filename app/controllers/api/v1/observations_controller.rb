module Api::V1
  class ObservationsController < ApplicationController
    load_and_authorize_resource

    skip_before_action :authenticate_user, only: [:index, :show]
    before_action :get_observation, only: [:show, :update, :destroy]

    def index
      if params[:page].present?
        observations = Observation.order('created_at DESC').page(page_param).per(20)
      else
        observations = Observation.order('created_at DESC')
      end
      render json: ObservationSerializer.new(observations).serialized_json
    end

    def show
      render json: ObservationSerializer.new(@observation).serialized_json
    end

    def create
      observation = Observation.new(observation_params)
      observation.legator = @current_user if @current_user.present?
      observation.habitat = observation.create_habitat(params[:habitat_category_id], params[:habitat_note], params[:habitat_species_ids])
      observation.substrate = observation.create_substrate(params[:substrate_category_id], params[:substrate_note], params[:substrate_species_ids])
      if params[:images].present?
        params[:images].each do |base64_img|
          @decoded_file = Base64.decode64(base64_img)
          @filename = "obs_#{Time.zone.now.to_s}"            # this will be used to create a tmpfile and also, while setting the filename to attachment
          @tmp_file = Tempfile.new(@filename)        # This creates an in-memory file
          @tmp_file.binmode                          # This helps writing the file in binary mode.
          @tmp_file.write @decoded_file
          @tmp_file.rewind()
          observation.images.attach(io: @tmp_file, filename: @filename) # attach the created in-memory file, using the filename defined above
          @tmp_file.unlink # deletes the temp file
        end
      end
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
        params.require(:observation).permit(:description, :area, :location, :longitude, :latitude, :altitude, :quantity, :explored_surface, :sample, :external_url, :approved, :observed_at, :species_id, images: [])
      end

  end
end
