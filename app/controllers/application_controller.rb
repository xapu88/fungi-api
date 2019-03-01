class ApplicationController < ActionController::API
  include ::ActionController::Cookies
  include Services::Auth

  before_action :authenticate_user

  def logged_in?
    !!current_user
  end

  def authenticate_user
    render json: {error: "unauthorized"}, status: 401 unless logged_in?
  end

  rescue_from CanCan::AccessDenied do |exception|
    render json: {error: "forbidden"}, status: 403
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
      logger.debug "Headers: #{request.headers["AUTHORIZATION"]}"
      logger.debug "Headers bearer: #{request.headers["AUTHORIZATION"].scan(/Bearer(.*)$/)}"
      request.headers["AUTHORIZATION"].scan(/Bearer
        (.*)$/).flatten.last
    end

    def auth
      Services::Auth.decode(token)
    end

    def auth_present?
      !!request.headers.fetch("AUTHORIZATION",
        "").scan(/Bearer/).flatten.first
    end
end
