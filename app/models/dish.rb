class Dish < ActiveRecord::Base
  belongs_to :category
  belongs_to :country

  has_and_belongs_to_many :menus

  has_and_belongs_to_many :orders

  has_attached_file :picture

  attr_accessible :name, :price_ht, :tva, :description, :category_id, :country_id

  def self.get_all_by_id(str)
    array = Array.new

    str.split(',').each do |s|
      array << Dish.find(s)
    end

    array
  end

  def price_ttc
  	price_ht + price_ht * tva / 100
  end
end
