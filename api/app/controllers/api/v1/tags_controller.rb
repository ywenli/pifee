class Api::V1::TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all
    render json: @tags
  end

  def show
    @works = Work.joins(:user).includes(:user).where(is_public: true).select('works.*, users.url').tagged_with(params[:name].to_s)
    render json: @works
  end
end
