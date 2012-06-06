class Dish < ActiveRecord::Base
  belongs_to :category
  belongs_to :country

  has_many :assignments
  has_many :menus, :through => :assignments

  attr_accessible :name, :priceHT, :tva, :description, :category_id, :country_id
end
