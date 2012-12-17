class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.references :house
      t.references :apartment
      t.attachment :image
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size

      t.timestamps
    end
    add_index :galleries, :house_id
    add_index :galleries, :apartment_id
  end
end
