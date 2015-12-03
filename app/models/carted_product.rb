class CartedProduct < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  belongs_to :order

  def subtotal
    quantity * product.price
  end
end
