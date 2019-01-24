module Api::V1
  class UsersController < ApplicationController
    skip_before_action :authenticate_user, only: [:show, :create]

    def show
      user = User.find(params[:id])
      render json: UserSerializer.new(user).serialized_json
    end

    def create
      user = User.new(user_params)
      if user.save
        created_jwt = Auth.issue({user: user.id})
        cookies.signed[:jwt] = { value: created_jwt, httponly: true, expires: 1.hour.from_now }
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
