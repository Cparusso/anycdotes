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
    story_tag_creator
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

  def story_tag_ids
    params["story"]["tag_ids"]
  end

  def story_tag_creator
    story_tag_ids.each do |tid|
      StoryTag.create(tag_id: tid, story_id: @story.id)
    end
  end
end
