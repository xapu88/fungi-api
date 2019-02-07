module Api::V1
  class SessionsController < ApplicationController
    skip_before_action :authenticate_user

    def create
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        created_jwt = Services::Auth.issue({user: user.id})
        cookies.signed[:jwt] = { value: created_jwt, httponly: true, expires: 1.hour.from_now }
        render json: { username: user.username }
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
