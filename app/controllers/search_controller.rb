class SearchController < ApplicationController
  def index
    if !params[:query].blank?
      @products = Product.search(params[:query])
      @categories = Category.search(params[:query])
    else
      @products = nil
    end
    
    respond_to do |format|
      format.html
      format.json { render json: { products: @products, categories: @categories }}
    end
  end
end
