class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.string :postalcode
      t.integer :category_id

      t.timestamps
    end
  end
end
