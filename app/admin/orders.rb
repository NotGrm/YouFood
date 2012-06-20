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

  show do |order|
    attributes_table do
      row :restaurant do
      	order.restaurant_name
      end

      row :table do
      	order.table_number
      end

      row :total do 
      	number_to_currency order.total_order_price
      end

    end
panel "Order Details" do
    table_for order.order_lines do
      column :name do |line|
      	link_to line.dish.name, admin_dish_path(line.dish)
      end

      column :quantity
    end
end

  end

end
