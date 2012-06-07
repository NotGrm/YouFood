class Table < ActiveRecord::Base
  belongs_to :zone
  attr_accessible :number, :zone_id
end
