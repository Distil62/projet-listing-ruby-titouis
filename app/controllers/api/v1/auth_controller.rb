class Api::V1::AuthController < Api::V1::ApiController

  def authenticate_user
    if (params[:email] && params[:password])
      user = User.find_for_database_authentication(email: params[:email])
      if user.valid_password?(params[:password])
        render json: payload(user)
      else
        render json: {errors: ['Invalid Username/Password']}, status: :unauthorized
      end
    else
      render json: {errors: ['Invalid Username/Password']}, status: :unauthorized
    end
  end

  private

  def payload(user)
    return nil unless user and user.id
    {
        auth_token: JsonWebToken.encode({user_id: user.id}),
        user: {id: user.id, email: user.email}
    }
  end

end
