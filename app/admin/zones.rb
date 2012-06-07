ActiveAdmin.register Zone do
  
	form do |f|
		f.inputs "General" do
			f.input :number
			f.input :waiters, :as => :check_boxes, :collection => Waiter.all, :member_label => :full_name
		end
		f.buttons
	end

end
