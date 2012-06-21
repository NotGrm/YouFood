ActiveAdmin.register Table do
  menu :if => Proc.new { current_admin_user.user_is_administrator? }
  
	form do |f|
		f.inputs "General" do
			f.input :number
			f.input :zone, :as => :radio, :collection => Zone.all, :member_label => :number
		end
		f.buttons
	end
end
