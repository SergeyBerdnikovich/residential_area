class AddColumnToHouse < ActiveRecord::Migration
  def change
    add_column :houses, :completed, :boolean
  end
end
