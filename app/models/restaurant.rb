class Restaurant < ActiveRecord::Base
  has_many :admin_users
  has_many :zones

  attr_accessible :address_1, :address_2, :city, :name, :zip_code
end
