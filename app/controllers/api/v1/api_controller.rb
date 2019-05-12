class Api::V1::ApiController < ApplicationController
  protect_from_forgery with: :null_session
  attr_reader :current_user

  protected

  def authenticate_request!

    unless user_id_in_token?
      render :json => {errors: ['Vous n\'êtes pas authentifié']}, status: :unauthorized
    end

    if (auth_token[:user_id])
      @current_user = User.find(auth_token['user_id']['$oid'])
    end
  rescue JWT::VerificationError, JWT::DecodeError
    render :json => {errors: ['Vous n\'êtes pas authentifié']}, status: :unauthorized

  end

  private

  def http_token
    @http_token ||= if request.headers['Authorization'].present?
                      request.headers['Authorization'].split(' ').last
                    end
  end

  def auth_token
    @auth_token ||= JsonWebToken.decode(http_token)
  end

  def user_id_in_token?
    http_token && auth_token && auth_token[:user_id].to_s
  end
end
