class CommentsController < ApplicationController
  before_action :find_comment, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorized, only: [:index, :show]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(user_id: session[:user_id], content: params[:comment][:content], story_id: params[:comment][:story_id])
    if @comment.valid?
      redirect_to @comment.story
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
      redirect_to @comment.story
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to edit_comment_path
    end
  end

  def destroy
    @user = @comment.user
    @comment.destroy
    redirect_to story_path(@comment.story)
  end

  private

  def find_comment
    @comment = Comment.find_by(id: params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id, :story_id)
  end
end
