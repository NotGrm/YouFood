ActiveAdmin.register Category do

	filter :name

	index do
		column :name
		default_actions
	end
  
end
