module Api::V1
  class SessionsController < ApplicationController
    skip_before_action :authenticate_user

    def create


      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        created_jwt = Services::Auth.issue({user: user.id})
        render json: { username: user.username, jwt: created_jwt }
      else
        render json: { error: 'Email or password incorrect' }, status: 401
      end
    end

    def destroy
      cookies.delete(:jwt)
      head :ok
    end

  end
end
