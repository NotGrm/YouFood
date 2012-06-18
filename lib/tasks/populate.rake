namespace :db do
  desc "Efface et remplis la Base de Donnees"
  task :populate =>:environment do
    require 'populator'
    require 'faker'
    
    [Country, Dish, Category, Waiter, Zone, Table, Order, OrderLine].each(&:delete_all)


    Zone.populate 5 do |zone|
        zone.number = zone.id

        Waiter.populate 1..3 do |waiter|
            waiter.first_name = Faker::Name.first_name
            waiter.last_name = Faker::Name.last_name
            waiter.email = Faker::Internet.email

            waiter.encrypted_password = Digest::SHA512.hexdigest(waiter.first_name)
        end

        Table.populate 4 do |table|
            table.number = table.id
            table.zone_id = zone.id
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
    		dish.priceHT = 1..100
    		dish.tva = [7, 19.6]
            
    		dish.category_id = Category.all.to_a
    	end
    end

    Order.populate 15 do |order|
        order.completed_at = 2.month.ago..Time.now
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