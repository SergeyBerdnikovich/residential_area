class CreatePhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.string :number
      t.references :heads
      t.references :partners

      t.timestamps
    end
    add_index :phone_numbers, :heads_id
    add_index :phone_numbers, :partners_id
  end
end
