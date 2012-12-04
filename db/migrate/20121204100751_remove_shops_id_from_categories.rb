class RemoveShopsIdFromCategories < ActiveRecord::Migration
  def up
    remove_column :categories, :shops_id
  end

  def down
    add_column :categories, :shops_id, :integer
  end
end
