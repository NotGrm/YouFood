class Waiter < AdminUser
  belongs_to :zone
  # attr_accessible :title, :body
end
