class OrderLine < ActiveRecord::Base
  belongs_to :dish
  belongs_to :order

  attr_accessible :quantity, :dish_id, :order_id

  def dish_category_name
  	dish_category_name = dish.category.name
  end

  def total_price
  	total_price = quantity*dish.price_ttc
  end
end
