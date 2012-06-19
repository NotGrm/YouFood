class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :restaurant

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :type, :id
  # attr_accessible :title, :body

  scope :all
  scope :administrator, where(:type => "Administrator")
  scope :cook, where(:type => "Cook")  
  scope :waiter, where(:type => "Waiter")  

  def full_name
    last_name.upcase + " " + first_name
  end
end
