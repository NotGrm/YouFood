namespace :db do
  desc "Efface et remplis la Base de Donnees"
  task :populate =>:environment do
    require 'populator'
    require 'faker'
    
    [Country, Dish, Category, Waiter].each(&:delete_all)

    Waiter.populate 2 do |waiter|
        waiter.first_name = Faker::Name.first_name
        waiter.last_name = Faker::Name.last_name
        waiter.email = Faker::Internet.email
        
        waiter.encrypted_password = Digest::SHA512.hexdigest(waiter.first_name)
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
        dish.description = Faker::Lorem.words
    		dish.category_id = Category.all.to_a
    	end
    end
  end
end