class OrderLine < ActiveRecord::Base
  belongs_to :dish
  attr_accessible :quantity
end
