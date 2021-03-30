class Api::V1::UsersController < ApplicationController
  #before_action :authenticate_user
  def index
    @users = User.all
    render json: @users
  end
  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile)
  end
end
