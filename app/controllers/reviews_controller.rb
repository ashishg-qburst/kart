class ReviewsController < ApplicationController
  def create
    @review = Review.create(review_params)
    @review.user_id = params[:user_id]
    @review.product_id = params[:product_id]
    if @review.save!
      flash[:success] = "Post Successful"
      redirect_to product_path(params[:product_id])
    else
      render 'static_pages/home'
    end
  end

  private
      def review_params
        params.require(:review).permit(:content, :user_id, :product_id)
      end
end
