class AddStatusToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :status_cd, :integer
  end
end
