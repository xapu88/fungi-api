module Api::V1
  class UsersController < ApplicationController
    before_action :authenticate_user, except: [:show]

    def show
      user = User.find(params[:id])
      render json: UserSerializer.new(user).serialized_json
    end

  end
end
