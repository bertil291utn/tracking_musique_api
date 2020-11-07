class Api::V1::TokensController < ApplicationController
  def create
    @user = User.find_by_email(user_params[:email])
    if @user&.authenticate(user_params[:password])
      render json: {
        token: JsonWebToken.encode(user_id: @user.id),
        email: @user.email,
      }
    else
      head :unauthorized
    end
  end

  def valid_token
    if current_user
      render json: {
        message: 'Valid token',
        status: 200,
      }
    else
      head :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
