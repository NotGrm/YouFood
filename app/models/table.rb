class Table < ActiveRecord::Base
  belongs_to :zone
  attr_accessible :number, :zone_id

  def get_restaurant
  	restaurant = zone.restaurant
  end
end
