class Api::V1::WorksController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @work = @user.works.build(work_params)

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
      params.require(:work).permit(:title, :body, :is_public)
    end
end
