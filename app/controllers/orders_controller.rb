class OrdersController < ApplicationController
  def create
    order = Order.create(
      quantity: params[:form_input_quantity],
      user_id: current_user.id
    )
    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
  end
end
