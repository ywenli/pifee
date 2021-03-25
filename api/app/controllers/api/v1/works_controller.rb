class Api::V1::WorksController < ApplicationController
  def index
    @work = Work.joins(:user).includes(:user).select('works.*, users.url, users.name').where(is_public: true)
    render json: @work
  end

  def show
    @work = Work.joins(:user).includes(:user).select('works.*, users.url, users.name').where(is_public: true).find(params[:id])
    render json: @work
  end

  # 全ての作品(ステータスが下書きor公開中)を取得 path: /works/all
  def get_works_all
    @work = Work.joins(:user).includes(:user).select('works.*, users.url, users.name')
    render json: @work
  end

  def create
    @user = User.find(params[:user_id])
    @work = @user.works.build(work_params)
    @work.tag_list = params[:tag_list]

    if @work.save
      render json: @work, status: :created
    else
      render json: @work.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @work = Work.find(params[:id])
    @work.destroy
  end

  def update
    @work = Work.find(params[:id])
    @work.tag_list = params[:tag_list]
    if @work.update(work_params)
      render json: @work
    else
      render json: @work.errors
    end
  end

  private

    def work_params
      params.require(:work).permit(:title, :body, :is_public, :tag_list)
    end
end
