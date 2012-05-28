class Menu < ActiveRecord::Base
  has_many :assignments
  has_many :dishes, :through => :assignments

  attr_accessible :begin_date, :dishes, :end_date, :title
end
