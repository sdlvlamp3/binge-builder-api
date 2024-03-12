class ApplicationController < ActionController::API
    
include SessionsHelper

    def authenticate_request
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        begin
          decoded = JWT.decode(header, Rails.application.secrests.secret_key_base).first
          current_user = User.find(decoded['user_id'])
        rescue JWT::ExpiredSignature
            render json: { error: 'Token has expired'}, status: :unauthorized
        rescue JWT::DecodeErrorr
            render json: { errors: 'Unauthorized'}, status: :unauthorized
        end
    end
end
