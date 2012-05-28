class Assignement < ActiveRecord::Base
  belongs_to :menu
  belongs_to :dish
  # attr_accessible :title, :body
end
