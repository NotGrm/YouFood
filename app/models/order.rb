class Order < ActiveRecord::Base
  belongs_to :table

  has_many :order_lines

  attr_accessible :completed_at, :paid_at, :provided_at, :ready_at, :table_id

  def total_order_price
	total_price = 0

	order_lines.each do |line|
		total_price += line.total_price
	end

  end
end
