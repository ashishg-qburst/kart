class ReviewsController < ApplicationController
  def create
    @review = current_user.reviews.build(review_params)
    @review.product_id = params[:product_id]
    if @review.save
      flash[:success] = "Post Successful"
    else
      flash[:danger] = "Could not submit review"
    end
    redirect_to product_path(params[:product_id])
  end

  def destroy
    @review = Review.find(params[:id])
    if (current_user.id == @review.user.id) && @review.destroy
      flash.now[:success] = "Review deleted"
    else
      flash.now[:danger] = "Could not delete review"
    end
    respond_to do |format|
      format.html { redirect_to request.referer }
      format.js
    end
  end

  private
      def review_params
        params.require(:review).permit(:content, :user_id, :product_id)
      end
end
