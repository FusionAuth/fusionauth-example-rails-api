class ApplicationController < ActionController::API
  before_action :require_jwt

  def require_jwt
    token = request.headers["HTTP_AUTHORIZATION"]
    if !token
      head :forbidden
    end
    if !valid_token(token)
      head :forbidden
    end
  end

  private
  def valid_token(token)
    unless token 
      return false
    end

    expected_iss = 'fusionauth.io'
    expected_aud = '238d4793-70de-4183-9707-48ed8ecd19d9'

    token.gsub!('Bearer ','')
    begin
      decoded_token = JWT.decode token, Rails.configuration.x.oauth.jwt_secret, true, { verify_iss: true, iss: expected_iss, verify_aud: true, aud: expected_aud, algorithm: 'HS256' }
      return true
    rescue JWT::DecodeError => e
      Rails.logger.warn "Error decoding the JWT: "+ e.to_s
    end
    false
  end
end
