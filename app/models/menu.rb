class Menu < ActiveRecord::Base
  has_and_belongs_to_many :dishes

  attr_accessible :begin_date, :dishes, :end_date, :title
end
