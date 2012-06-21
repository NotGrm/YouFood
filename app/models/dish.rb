class Dish < ActiveRecord::Base
  belongs_to :category
  belongs_to :country

  has_and_belongs_to_many :dish_menus

  has_and_belongs_to_many :orders

  has_attached_file :picture, :default_url => "http://placehold.it/260x180"

  attr_accessible :name, :price_ht, :tva, :description, :category_id, :country_id, :picture

#
#

  def self.get_all_by_id(str)
    array = Array.new

    str.split(',').each do |s|
      array << Dish.find(s)
    end

    array
  end

  def get_safe_picture_url
    pictures = Hash.new {}
    pictures["choucroute"] = "http://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Choucroute-p1030190.jpg/783px-Choucroute-p1030190.jpg"
    pictures["harengs marines"] = "http://blog.deluxe.fr/wp-content/uploads/2007/09/harengs-pommes-a-leau-01.jpg"
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

    url = pictures[name]

  end

  def price_ttc
    price_ht + price_ht * tva / 100
  end
end
