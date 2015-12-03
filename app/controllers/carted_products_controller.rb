class CartedProductsController < ApplicationController
  def index
    if current_user && current_user.carted_products.where(status: "carted").any?
      @carted_products = current_user.carted_products.where(status: "carted")
    else
      flash[:warning] = "You don't have anything in your cart. Buy some stuff now!!!"
      redirect_to "/"
    end
  end

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

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.update(status: "removed")
    flash[:success] = "Product successfully removed! Order something else though..."
    redirect_to "/carted_products"
  end
end
