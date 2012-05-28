class Table < ActiveRecord::Base
  belongs_to :zone
  attr_accessible :number
end
