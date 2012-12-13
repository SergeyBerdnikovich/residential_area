class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address
      t.float :longitude
      t.float :latitude
      t.references :house
      t.references :head
      t.references :partner

      t.timestamps
    end
    add_index :locations, :house_id
    add_index :locations, :head_id
    add_index :locations, :partner_id
  end
end
