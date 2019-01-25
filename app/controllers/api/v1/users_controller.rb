module Api::V1
  class UsersController < ApplicationController
    load_and_authorize_resource
    
    skip_before_action :authenticate_user, only: [:show]

    def index
      users = User.page(page_param).per(30)
      render json: UserSerializer.new(users).serialized_json
    end

    def show
      user = User.find(params[:id])
      render json: UserSerializer.new(user).serialized_json
    end

    def create
      user = User.new(user_params)
      if user.save
        render json: { username: user.username }, status: 200
      else
        render json: { errors: user.errors }, status: 422
      end
    end


    private

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :username)
      end

  end
end
