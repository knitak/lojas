class AddCityToShop < ActiveRecord::Migration
  def change
    add_column :shops, :city, :string
  end
end
