class ReviewsController < ApplicationController
  def new
    @kitten = Kitten.find(params[:kitten_id])
    @review = Review.new
  end

  def create
    @review.new(review_params)
    @review.kitten = Kitten.find(params[:kitten_id])
    @review.save ? (render_to kitten_path) : (render :new)
  end

  private

  def review_params
    parmas.require(:review).permit(:content)
  end
end
