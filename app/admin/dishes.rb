ActiveAdmin.register Dish do
  
  filter :category
  filter :country
  filter :name
  filter :priceHT
  filter :tva, :as => :select, :collection => [7.00, 19.6]

  index do
  	column :name
  	column "Price", :priceHT do |dish|
  		number_to_currency dish.priceHT
  	end
  	column :tva do |dish|
  		number_to_percentage dish.tva, :precision => 2
  	end
  	column :category
  	column :country
  	default_actions
  end
end
