class Assignement < ActiveRecord::Base
  belongs_to :dish_menu
  belongs_to :dish
  # attr_accessible :title, :body
end
