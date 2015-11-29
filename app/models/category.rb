class Category < ActiveRecord::Base
  has_many :categorized_products
end
