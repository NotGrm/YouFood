class Dish < ActiveRecord::Base
  belongs_to :category
  belongs_to :country

  has_many :assignments
  has_many :menus, :through => :assignments

  has_and_belongs_to_many :orders

  has_attached_file :picture

  attr_accessible :name, :priceHT, :tva, :description, :category_id, :country_id

  def subtotal
  	priceHT * tva
  end
end
