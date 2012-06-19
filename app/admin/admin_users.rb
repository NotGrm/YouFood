ActiveAdmin.register AdminUser do
  
  filter :first_name
  filter :last_name

  scope :all
  scope :administrator
  scope :cook 
  scope :waiter 

  index do
    column :email
    column :first_name
    column :last_name
    column :type
    default_actions
  end

  form do |f|
    f.inputs "General" do
      f.input :first_name
      f.input :last_name
      f.input :type, :as => :select, :collection => ["Administrator","Cook","Waiter"]

      f.input :email
      f.input :password
      f.input :password_confirmation

    end
    f.buttons
  end
end
