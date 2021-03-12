class Api::V1::TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all
    render json: @tags
  end

  def show
    @works = Work.tagged_with(params[:name].to_s)
    render json: @works
  end
end
