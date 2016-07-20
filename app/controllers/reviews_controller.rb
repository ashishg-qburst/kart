class ReviewsController < ApplicationController
  def create
    @review = current_user.reviews.build(review_params)
    @review.product_id = params[:product_id]
    if @review.save
      flash[:success] = "Post Successful"
      redirect_to product_path(params[:product_id])
    else
      flash[:danger] = "Could not submit review"
      redirect_to product_path(params[:product_id])
    end
  end

  private
      def review_params
        params.require(:review).permit(:content, :user_id, :product_id)
      end
end
