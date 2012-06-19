class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :dishes


  def dishes_count
  	dishes.count
  end

end
