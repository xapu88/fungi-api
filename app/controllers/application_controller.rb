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
    logger.debug "Auth param should be present: #{auth_present?}"
    if auth_present?
      logger.debug "Auth-user: #{ auth["user"] }"
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
      request.env["AUTHORIZATION"].scan(/Bearer
        (.*)$/).flatten.last
    end

    def auth
      Services::Auth.decode(token)
    end

    def auth_present?
      logger.debug "Auth present 0: #{request.headers["AUTHORIZATION"]}"
      logger.debug "Auth present 1: #{request.env.fetch("AUTHORIZATION", "")}"
      logger.debug "Auth present 2: #{request.env.fetch("AUTHORIZATION", "").scan(/Bearer/)}"
      logger.debug "Auth present 3: #{request.env.fetch("AUTHORIZATION", "").scan(/Bearer/).flatten.first}"
      !!request.env.fetch("AUTHORIZATION",
        "").scan(/Bearer/).flatten.first
    end
end
