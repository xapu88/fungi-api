module Api::V1
  class SubstratesController < ApplicationController
    skip_before_action :authenticate_user, only: [:show]
    before_action :get_substrate, only: [:show]

    def show
      render json: SubstrateSerializer.new(@substrate).serialized_json
    end

    private

      def get_substrate
        @substrate = Substrate.find(params[:id])
      end
  end
end
