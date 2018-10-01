class StoriesController < ApplicationController
  before_action :find_story, only: [:show, :edit, :update, :destroy]

  def index
    @stories = Story.all
  end

  def show

  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.create(story_params)
    redirect_to @story
  end

  def edit

  end

  def update
    @story.update(story_params)
    redirect_to @story
  end

  def destroy
    @story.destroy
    redirect_to stories_path
  end

  private

  def find_story
    @story = Story.find_by(id: params[:id])
  end

  def story_params
    params.require(:story).permit(:title, :content, :user_id, :location_id)
  end
end
