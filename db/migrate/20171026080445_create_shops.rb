class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.integer :count

      t.timestamps null: false
    end
  end
end
