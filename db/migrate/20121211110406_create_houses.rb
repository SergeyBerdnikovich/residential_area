class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
