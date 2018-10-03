class CommentsController < ApplicationController
  before_action :find_comment, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorized, only: [:index, :show]

  def index
    @comments = Comment.all
  end

  def show

  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    if @comment.valid?
      comment_tag_creator
      redirect_to @comment
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to new_comment_path
    end
  end

  def edit

  end

  def update
    @comment.update(comment_params)
    if @comment.valid?
      @comment.comment_tags.destroy_all
      comment_tag_creator
      redirect_to @comment
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to edit_comment_path
    end
  end

  def destroy
    @user = @comment.user
    @comment.destroy
    redirect_to user_path(@user)
  end

  private

  def find_comment
    @comment = Comment.find_by(id: params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id, :story_id)
  end
end
