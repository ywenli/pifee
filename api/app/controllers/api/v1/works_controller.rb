class Api::V1::WorksController < ApplicationController

  def index
    @work = Work.preload(:tags)
    render json: @work
  end

  def show
    @work = Work.find(params[:id])
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
    @work.destroy
  end

  private

    def work_params
      params.require(:work).permit(:title, :body, :user_id, :is_public, :tag_list)
    end
end
