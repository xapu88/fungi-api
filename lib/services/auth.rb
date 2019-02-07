require 'jwt'

module Services
  module Auth

    ALGORITHM = 'HS256'

    def self.issue(payload)
      JWT.encode(
        payload,
        auth_secret,
        ALGORITHM
      )
    end

    def self.decode(token)
      JWT.decode(
        token,
        auth_secret,
        true,
        { algorithm: ALGORITHM }
      ).first
    end

    def self.auth_secret
      if Rails.env.production?
        ENV['SECRET_KEY_BASE']
      else
        Rails.application.secrets.secret_key_base
      end
    end

  end
end
