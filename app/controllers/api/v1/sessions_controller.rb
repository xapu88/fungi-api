module Api::V1
  class SessionsController < ApplicationController
    skip_before_action :authenticate_user

    def create
      user = User.find_by(email: auth_params[:email])
      if user && user.authenticate(auth_params[:password])
        created_jwt = Services::Auth.issue({user: user.id})
        render json: { jwt: created_jwt, user_id: user.id }, status: 200
      else
        render json: { error: 'Email or password incorrect' }, status: 401
      end
    end

    private

      def auth_params
        params.require(:auth).permit(:email, :password)
      end

  end
end
