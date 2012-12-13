class CreatePhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.string :number
      t.references :head
      t.references :partner

      t.timestamps
    end
    add_index :phone_numbers, :head_id
    add_index :phone_numbers, :partner_id
  end
end
