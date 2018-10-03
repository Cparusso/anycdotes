class StoriesController < ApplicationController
  before_action :find_story, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorized, only: [:index, :show]

  def index
    @stories = Story.all
  end

  def show

  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.create(user_id: session[:user_id], title: params[:story][:title], content: params[:story][:content], location_id: params[:story][:location_id], tag_ids: story_tag_ids)
    byebug
    if @story.valid?
      story_tag_creator
      redirect_to @story
    else
      flash[:errors] = @story.errors.full_messages
      redirect_to new_story_path
    end
  end

  def edit
    if current_user != @story.user
      redirect_to @story.user
    end
  end

  def update
    @story.update(user_id: session[:user_id], title: params[:title], content: params[:content], location_id: params[:location_id])
    if @story.valid?
      @story.story_tags.destroy_all
      story_tag_creator
      redirect_to @story
    else
      flash[:errors] = @story.errors.full_messages
      redirect_to edit_story_path
    end
  end

  def destroy
    if current_user != @story.user
      redirect_to @story.user
    else
      @user = @story.user
      @story.destroy
      redirect_to user_path(@user)
    end
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
