class TagsController < ApplicationController
  before_action :find_tag, only: [:show]
  skip_before_action :authorized, only: [:index, :show]

  def index
    @tags = Tag.all
  end

  def show

  end

  private

  def find_tag
    @tag = Tag.find_by(id: params[:id])
  end
end
