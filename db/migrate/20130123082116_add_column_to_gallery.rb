class AddColumnToGallery < ActiveRecord::Migration
  def change
    add_column :galleries, :for_carousel, :boolean
  end
end
