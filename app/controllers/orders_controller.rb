class OrdersController < ApplicationController
  def create
    product = Product.find_by(id: params[:form_input_product_id])
    price = product.price
    quantity = params[:form_input_quantity].to_i
    calculated_subtotal = price * quantity
    calculated_tax = calculated_subtotal * Product::SALES_TAX
    calculated_total = calculated_subtotal + calculated_tax

    order = Order.create(
      quantity: params[:form_input_quantity],
      product_id: params[:form_input_product_id],
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
    )
    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
  end
end
