class Api::V1::LikesController < ApplicationController
  # before_action :authenticate_user

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

  # 今日のランキングから上位6つを取得
  # TODO: 以下3つのランキングメソッドは冗長なのでリファクタリングする
  def get_top_6_in_today_ranking
    @today_ranks = Work.find(Like.where(created_at: Time.current.all_day).group(:work_id).order('count(work_id) desc').limit(6).pluck(:work_id))
    render json: @today_ranks
  end

  # 週間のランキングから上位6つを取得
  def get_top_6_in_weekly_ranking
    @weekly_ranks = Work.find(Like.where(created_at: Time.current.all_week).group(:work_id).order('count(work_id) desc').limit(6).pluck(:work_id))
    render json: @weekly_ranks
  end

  # 全期間のランキングから上位6つを取得
  def get_top_6_in_all_ranking
    @all_ranks = Work.find(Like.group(:work_id).order('count(work_id) desc').limit(6).pluck(:work_id))
    render json: @all_ranks
  end

  private

    def likes_params
      params.require(:like).permit(:work_id)
    end
end
