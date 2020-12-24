class ReviewsController < ApplicationController
  def create
    # render plain: params[:review].inspect
    @review = Review.new(review_params)
    @review.reviewer_id = current_user.id

    @review.save
    redirect_to profile_path(id: params[:user_id])
  end

  private def review_params
    params.require(:review).permit(:text, :user_id)
  end
end
