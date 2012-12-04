class RemoveCategoryFromShops < ActiveRecord::Migration
  def up
    remove_column :shops, :category
  end

  def down
    add_column :shops, :category, :string
  end
end
