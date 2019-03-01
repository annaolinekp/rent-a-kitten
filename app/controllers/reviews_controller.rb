class ReviewsController < ApplicationController
  def new
    @kitten = Kitten.find(params[:kitten_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # @review.new(review_params)
    @review.kitten = Kitten.find(params[:kitten_id])
    @review.user = current_user
    @review.save ? (redirect_to kitten_path(@review.kitten)) : (render :new)
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
