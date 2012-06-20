namespace :db do
  desc "Efface et remplis la Base de Donnees"
  task :populate =>:environment do
    require 'populator'
    require 'faker'
    
    [Country, Dish, Category, Cook, Waiter, Zone, Table, Order, OrderLine, Restaurant].each(&:delete_all)


    Restaurant.populate 10 do |restaurant|
        restaurant.name = Faker::Lorem.words(1)
        restaurant.address_1 = Faker::Address.street_address
        restaurant.zip_code = Faker::Address.zip_code
        restaurant.city = Faker::Address.city

        Waiter.populate 1..3 do |waiter|
            waiter.restaurant_id = restaurant.id

            waiter.first_name = Faker::Name.first_name
            waiter.last_name = Faker::Name.last_name
            waiter.email = Faker::Internet.email

            waiter.encrypted_password = Digest::SHA512.hexdigest(waiter.first_name)

            Zone.populate 1 do |zone|
                zone.waiter_id = waiter.id
                zone.restaurant_id = restaurant.id
                waiter.zone_id = zone.id

                zone.name = zone.id 

                Table.populate 4 do |table|
                    table.number = table.id
                    table.zone_id = zone.id
                end   
            end
        end 

        Cook.populate 1..2 do |cook|
            cook.id += 100
            cook.restaurant_id = restaurant.id

            cook.first_name = Faker::Name.first_name
            cook.last_name = Faker::Name.last_name
            cook.email = Faker::Internet.email

            cook.encrypted_password = Digest::SHA512.hexdigest(cook.first_name)
        end
    end

    Category.populate 6 do |category|
    	category.name = Faker::Lorem.words(1)
    end
    
    Country.populate 20 do |country|
    	country.name = Faker::Address.country
    	
    	Dish.populate 1..5 do |dish|
    		dish.country_id = country.id
    		dish.name = Faker::Lorem.words
    		dish.price_ht = 1..100
    		dish.tva = [7, 19.6]
            
    		dish.category_id = Category.all.to_a
    	end
    end

    Order.populate 15 do |order|
        order.created_at = 2.month.ago..Time.now
        order.table_id = Table.all.to_a
        order.status_cd = 0..3

        OrderLine.populate 3..6 do |line|
            line.order_id = order.id
            line.quantity = 1..5
            line.dish_id = Dish.all.to_a
        end
    end

  end
end