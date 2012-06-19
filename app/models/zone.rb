class Zone < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :waiter
  attr_accessible :name, :waiter_id, :restaurant_id
end
