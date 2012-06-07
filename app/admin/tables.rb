ActiveAdmin.register Table do
  
	form do |f|
		f.inputs "General" do
			f.input :number
			f.input :zone, :as => :radio, :collection => Zone.all, :member_label => :number
		end
		f.buttons
	end
end
