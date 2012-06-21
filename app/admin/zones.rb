ActiveAdmin.register Zone do
  menu :if => Proc.new { current_admin_user.user_is_administrator? }
  
	form do |f|
		f.inputs "General" do
			f.input :name
			f.input :waiter, :as => :radio, :collection => Waiter.all, :member_label => :full_name
		end
		f.buttons
	end
end
