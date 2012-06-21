namespace :db do
  desc "Efface et remplis la Base de Donnees"
  task :populate =>:environment do
    require 'populator'
    require 'faker'
    
    [Country, Dish, Category, Cook, Waiter, Zone, Table, Order, OrderLine, Restaurant].each(&:delete_all)


    Restaurant.populate 1 do |restaurant|
        restaurant.name = "YouFood_Caen"
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
    pictures = Hash.new {}
    pictures["choucroute"] = "http://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Choucroute-p1030190.jpg/783px-Choucroute-p1030190.jpg"
    pictures["harengs marines"] = "blog.deluxe.fr/wp-content/uploads/2007/09/harengs-pommes-a-leau-01.jpg"
    pictures["fondue vigneronne"] = "https://saveursdumonde.blob.core.windows.net/saveursdumonde/site/recipies/1429.jpg"
    pictures["soupe"] = "http://commande-repas.fr/wp-content/uploads/soupe.jpg"
    pictures["flammekueche"] = "http://www.cuistot.eu/pictures/1171796934Flammekueche.jpg"
    pictures["morue a la biscaina"] = "http://assets.euroresidentes.com/Recetas/imagenes/recetas-002.jpg"
    pictures["truffade"] = "http://img.750g.com/galaxie/123/8781/4439/la_truffade.jpg"
    pictures["pompe aux grattons"] = "http://samgraphic18.files.wordpress.com/2010/03/pompe-aux-gratons.jpg"
    pictures["pompe aux pommes"] ="http://petitelolie.canalblog.com/images/pompe.jpg"
    pictures["piquenchagne"] = "http://img.750g.com/galaxie/986/95692/7031/le_piquenchagne.jpeg"
    pictures["canard a la duchambais"] = "http://www.comtessedubarry.com/media/catalog/product/cache/1/image/380x257/040ec09b1e35df139433887a97daa66f/c/d/cdu07_1_1_1.jpg"
    pictures["dinde de jaligny"] = "http://www.allier-tourisme.com/dolce-vita/news/lettre/133-2-dinde.jpg"
    pictures["lentilles vertes du puy"] = "http://storage.canalblog.com/17/53/366358/69399152_p.jpg"
    pictures["patranque"] = "http://www.cote-sioule.fr/photos/truffade.jpg"
    pictures["les tripes a la mode de caen"] = "http://www.cotecaen.fr/files/2011/10/P9-TripeRecette.jpg"
    pictures["teurgoule"] = "http://gatodejerome.free.fr/teurgoulopomme.jpg"
    pictures["andouille de vire"] = "http://www.gourmandie.fr/image/recette/recette-11.jpg"

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
        dish.description = Populator.sentences(2..10)
            
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