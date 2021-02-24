class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user

  def show
    render json: current_user.my_json
  end

  def my_json
    as_json(only: [:id, :name, :email, :created_at])
  end
end
