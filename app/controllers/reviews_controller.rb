class ReviewsController < ApplicationController
  before_action :find_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def show

  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)
    if @review.valid?
      review_tag_creator
      redirect_to reviews_path
    else
      flash[:errors] = @review.errors.full_messages
      redirect_to new_review_path
    end
  end

  def edit

  end

  def update
    @review.update(review_params)
    if @review.valid?
      @review.review_tags.destroy_all
      review_tag_creator
      redirect_to @review
    else
      flash[:errors] = @review.errors.full_messages
      redirect_to edit_review_path
    end
  end

  def destroy
    @user = @review.user
    @review.destroy
    redirect_to user_path(@user)
  end

  private

  def find_review
    @review = Review.find_by(id: params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating, :story_id, :review_id)
  end


  def review_tag_ids
    params["review"]["story_ids"]
  end

  def review_tag_creator
      StoryReview.create(story_id: review_params, review_id: @review.id)
  end
end
