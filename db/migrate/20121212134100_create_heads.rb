class CreateHeads < ActiveRecord::Migration
  def change
    create_table :heads do |t|
      t.string :full_name
      t.string :position

      t.timestamps
    end
  end
end
