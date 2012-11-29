class AddCategoryToShop < ActiveRecord::Migration
  def change
    add_column :shops, :category, :string
  end
end
