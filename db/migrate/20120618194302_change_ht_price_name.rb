class ChangeHtPriceName < ActiveRecord::Migration
  def up
  	rename_column :dishes, :priceHT, :price_ht
  end

  def down
  	rename_column :dishes, :price_ht, :priceHT
  end
end
