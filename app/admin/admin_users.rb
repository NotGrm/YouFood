ActiveAdmin.register AdminUser do
  
  filter :first_name
  filter :last_name
  filter :type, :as => :select, :collection => ["Cook", "Waiter"]

  scope :all
  scope :cook 
  scope :waiter 

  index do
    column :email
    column :username
    column :first_name
    column :last_name
    column :type
    default_actions
  end

  form do |f|
      f.inputs "General" do
        f.input :first_name
        f.input :last_name
        f.input :type, :as => :select, :collection => ["Cook","Waiter"]
      end
      f.buttons
    end
end
