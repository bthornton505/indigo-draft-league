class ApplicationController < ActionController::API
  respond_to :json
  before_action :process_token

  def authenticate_user!(options = {})
    head :unauthorized unless signed_in?
  end 

  def signed_in?
    @current_user_id.present?
  end 

  def current_user 
    @current_user_id ||= super || User.find(@current_user_id)
  end 

  def process_token 
    authorization_header = request.headers['Authorization']

    if authorization_header.present?
      begin 
        jwt_payload = JWT.decode(authorization_header.split(' ')[1], ENV['DEVISE_JWT_SECRET_KEY'], true, { algorithm: 'HS256'} )
        @current_user_id = jwt_payload['id']
      rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
        head :unauthorized
      end 
    end 
  end 
end
