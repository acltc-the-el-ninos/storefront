class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :calculate_cart_count

  def calculate_cart_count
    if current_user
      @cart_count = current_user.carted_products.where(status: "carted").count
    else
      @cart_count = 0
    end
  end
end
