class ApplicationController < ActionController::API
  include ::ActionController::Cookies

  before_action :authenticate_user

  def logged_in?
    !!current_user
  end

  def authenticate_user
    render json: {error: "unauthorized"}, status: 401 unless logged_in?
  end

  def current_user
    if auth_present?
      user = User.find(auth["user"])
      if user
        @current_user ||= user
      end
    end
  end

  def page_param
    params[:page] || 1
  end


  private

    def token
      cookies.signed[:jwt]
    end

    def auth
      Auth.decode(token)
    end

    def auth_present?
      !!token
    end
end
