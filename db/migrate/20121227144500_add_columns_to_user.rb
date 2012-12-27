class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :role_id, :integer
    add_column :users, :name, :string
    add_index :users, :role_id
  end
end
