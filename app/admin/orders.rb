ActiveAdmin.register Order do
  index do

  	column :id

  	column :created_at

  	column :restaurant do |order|
  		order.restaurant_name
  	end

  	column :table do |order|
  		order.table_number
  	end

  	column :total do |order|
  		number_to_currency order.total_order_price
  	end
  	default_actions
  end

end
