class Order < ActiveRecord::Base
  as_enum :status, [:ordered, :ready, :at_table, :paid]

  belongs_to :table

  has_many :order_lines

  attr_accessible :completed_at, :paid_at, :provided_at, :ready_at, :table_id

  def self.categories_count

    counts = Hash.new(0)

    Order.all.each do |order|

      order.order_lines.each {|line| counts[line.dish_category_name] += 1}
    end

    counts
  end

  def table_number
    table.number
  end

  def total_order_price
	  total_price = 0

	  order_lines.each do |line|
		  total_price += line.total_price
	  end

	  total_price
  end

  def add_dish(dish_id)
    current_dish = order_lines.find_by_dish_id(dish_id)

    if current_dish
      current_dish.quantity += 1
    else
      current_dish = order_lines.build(:dish_id => dish_id)
      current_dish.quantity = 1
    end

    current_dish
  end
end
