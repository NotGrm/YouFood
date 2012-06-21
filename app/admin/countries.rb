ActiveAdmin.register Country do
	menu :if => Proc.new { current_admin_user.user_is_administrator? }

	filter :name

	index do
		column :name
		default_actions
	end
  
end
