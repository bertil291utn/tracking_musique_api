class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy user_artists]

  def create
    user = User.new(user_params)
    if user.save
      render json: { user: { id: user.id, name: user.name, email: user.email }, token: JsonWebToken.encode(user_id: user.id) }, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: UserSerializer.new(@user).serializable_hash
  end

  def user_artists
    options = { include: [:artists] }
    render json: UserSerializer.new(@user, options).serializable_hash
  end

  def update
    if @user.update(user_params)
      render json: UserSerializer.new(@user).serializable_hash, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    head 204
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
