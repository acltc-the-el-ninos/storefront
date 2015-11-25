class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :images
  belongs_to :user
  has_many :orders
  
  SALES_TAX = 0.09   
  DISCOUNT_THRESHOLD = 50    
   
  def sale_message   
    if price < DISCOUNT_THRESHOLD    
      "Discount Item!"   
    else   
      "On Sale!"   
    end    
  end    
   
  def tax    
    price.to_i * SALES_TAX   
  end    
   
  def total    
    price.to_i + tax   
  end

  def self.get_discount_threshold
    DISCOUNT_THRESHOLD
  end
end
