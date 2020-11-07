class Api::V1::TokensController < ApplicationController
  def create
    @user = User.find_by_email(user_params[:email])
    if @user&.authenticate(user_params[:password])
      render json: {
        token: JsonWebToken.encode(user_id: @user.id),
        userid: @user.id,
      }
    else
      render json: { message: 'Invalid credentials' }, status: :unauthorized
    end
  end

  def valid_token
    if current_user
      render json: { message: 'Valid token', userId: current_user.id }
    else
      render json: { message: 'Unauthorized token' }, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
