module Api::V1
  class ObservationsController < ApplicationController
    load_and_authorize_resource

    skip_before_action :authenticate_user, only: [:index, :show]
    before_action :get_observation, only: [:show, :update, :destroy]

    def index
      if params[:page].present?
        observations = Observation.with_attached_images.includes(:legator, :determinator, :species, :comments).order('created_at DESC').page(page_param).per(20)
      else
        observations = Observation.with_attached_images.includes(:legator, :determinator, :species, :comments).order('created_at DESC')
      end
      render json: ObservationSerializer.new(observations).serialized_json
    end

    def show
      render json: ObservationSerializer.new(@observation).serialized_json
    end

    def create
      observation = Observation.new(observation_params)
      observation.legator = @current_user if @current_user.present?
      if observation.save
        observation.habitat = observation.create_habitat(params[:habitat_category_id], params[:habitat_note], params[:habitat_species_ids])
        observation.substrate = observation.create_substrate(params[:substrate_category_id], params[:substrate_note], params[:substrate_species_ids])
        observation.determinator = @current_user if observation.species_id.present?
        if params[:images].present?
          params[:images].each_with_index do |base64_string, index|
            content_type = base64_string[/(image\/[a-z]{3,4})|(application\/[a-z]{3,4})/]
            content_type = content_type[/\b(?!.*\/).*/]
            base64_img = base64_string.sub(/data:((image|application)\/.{3,}),/, '')
            @decoded_file = Base64.decode64(base64_img)
            @filename = "obs_#{observation.number}_#{index+1}.#{content_type}"
            @tmp_file = Tempfile.new(@filename)
            @tmp_file.binmode
            @tmp_file.write @decoded_file
            @tmp_file.rewind()
            observation.images.attach(io: @tmp_file, filename: @filename)
            @tmp_file.unlink
          end
        end
        if observation.save
          render json: ObservationSerializer.new(observation).serialized_json, status: 200
        else
          render json: { errors: observation.errors }, status: 422
        end
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
        @observation = Observation.with_attached_images.includes(:legator, :determinator, :species, :comments).find(params[:id])
      end

      def observation_params
        params.require(:observation).permit(:description, :area, :location, :longitude, :latitude, :altitude, :quantity, :explored_surface, :sample, :external_url, :approved, :observed_at, :species_id, images: [])
      end

  end
end
