class CartedProductsController < ApplicationController
  def create
    user_id = current_user.id
    product_id = params[:form_input_product_id]
    quantity = params[:form_input_quantity]
    CartedProduct.create(
      user_id: user_id,
      product_id: product_id,
      quantity: quantity,
      status: "carted"
    )
    redirect_to "/carted_products"
  end
end