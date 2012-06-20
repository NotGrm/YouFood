class DishMenu < ActiveRecord::Base

  has_and_belongs_to_many :dishes

  attr_accessible :begin_date, :end_date, :title
end
