namespace :db do
  desc "Efface et remplis la Base de Donnees"
  task :populate =>:environment do
    require 'populator'
    require 'faker'
    
    [Country, Dish, Category, Cook, Waiter, Zone, Table, Order, OrderLine, Restaurant].each(&:delete_all)

    restaurants = ["Caen", "Paris", "Marseille"]
        i = 0
    Restaurant.populate 3 do |restaurant|

        restaurant.name = restaurants[i]
        i += 1
        restaurant.address_1 = Faker::Address.street_address
        restaurant.zip_code = Faker::Address.zip_code
        restaurant.city = Faker::Address.city

        Waiter.populate 1 do |waiter|
            waiter.restaurant_id = restaurant.id

            waiter.first_name = Faker::Name.first_name
            waiter.last_name = Faker::Name.last_name
            waiter.email = Faker::Internet.email

            waiter.encrypted_password = Digest::SHA512.hexdigest("password")

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

        Cook.populate 1 do |cook|
            cook.id += 100
            cook.restaurant_id = restaurant.id

            cook.first_name = Faker::Name.first_name
            cook.last_name = Faker::Name.last_name
            cook.email = Faker::Internet.email

            cook.encrypted_password = Digest::SHA512.hexdigest("password")
        end
    end

    arrayCategories = Array.new(9)
    arrayCategories = ["Hamburger","Pizza","Pattes","Salades","Entrees","Desserts","Fromage", "Gateaux","Glaces"]
    i = 0
    Category.populate 8 do |category|
        category.name = arrayCategories[i]
      i+=1
    end

    arrayDishies = Array.new(15)
    arrayDishies = ["choucroute","flammekueche","fondue vigneronne","harengs marines","soupe","morue a la biscaina","truffade", "pompe aux grattons","pompe aux pommes", "piquenchagne", "canard a la duchambais","dinde de jaligny","lentilles vertes du puy","patranque","les tripes a la mode de caen","andouille de Vire","la teurgoule"]

    Country.populate 20 do |country|
        country.name = Faker::Address.country
      i = 0
        Dish.populate 1..5 do |dish|
            dish.country_id = country.id
            dish.name = arrayDishies[i]
        #dish.picture_file_name = pictures[arrayDishies[i]]
        i+=1
            dish.price_ht = 1..100
            dish.tva = [7, 19.6]
        dish.description = Populator.sentences(1)
            
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