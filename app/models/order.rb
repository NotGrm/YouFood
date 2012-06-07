class Order < ActiveRecord::Base
  belongs_to :table

  has_and_belongs_to_many :dishes

  attr_accessible :completed_at, :paid_at, :provided_at, :ready_at, :table_id

  def total_price
  	total_price = dishes.inject(0) { |sum, p| sum + p.subtotal }
  end
end
