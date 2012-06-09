ActiveAdmin.register Dish do
  
  filter :category
  filter :country
  filter :name
  filter :price_ht
  filter :tva, :as => :select, :collection => [7.00, 19.6]

  index do
  	column :name
  	column "Price", :price_ht do |dish|
  		number_to_currency dish.priceHT
  	end
  	column :tva do |dish|
  		number_to_percentage dish.tva, :precision => 2
  	end
  	column :category
  	column :country
  	default_actions
  end

  form do |f|
    f.inputs "General" do
      f.input :name
      f.input :price_ht
      f.input :tva, :as => :radio, :collection => [7.00, 19.6]
      f.input :picture
      f.input :country
      f.input :category
    end
    f.buttons
  end
end
