ActiveAdmin.register Country do

	filter :name

	index do
		column :name
		default_actions
	end
  
end
