class Api::V1::LikesController < ApplicationController
  #before_action :authenticate_user

  def index
    @like = Like.filter_by_work(params[:work_id]).select(:id, :user_id, :work_id)
    render json: @like
  end

  def create
    @user = User.find(params[:user_id])
    @like = @user.likes.create!(likes_params)
    render json: @like
  end

  def destroy
    @user = User.find(params[:user_id])
    @like = @user.likes.find(params[:id])
    @like.destroy!
    # TODO: テスト用出力なので削除する
    @likes = Like.filter_by_work(params[:work_id]).select(:id, :user_id, :work_id)
    render json: @likes
  end

  private

    def likes_params
      params.require(:like).permit(:work_id)
    end
end
