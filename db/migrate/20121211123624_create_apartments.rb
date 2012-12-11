class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.references :house
      t.string :title
      t.string :description
      t.integer :cost
      t.integer :space
      t.integer :number_of_rooms
      t.boolean :residential

      t.timestamps
    end
    add_index :apartments, :house_id
  end
end
