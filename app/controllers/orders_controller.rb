class OrdersController < ApplicationController
  def create
    redirect_to "/orders/:id"
  end
end
