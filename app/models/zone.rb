class Zone < ActiveRecord::Base
  attr_accessible :number
  has_many :tables
end
