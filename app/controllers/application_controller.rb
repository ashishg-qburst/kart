class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include CurrentCart
  before_action :set_cart
  
  protect_from_forgery with: :exception
  def get_categories
    Category.all
  end
end
