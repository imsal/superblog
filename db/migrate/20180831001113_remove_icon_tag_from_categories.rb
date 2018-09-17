class RemoveIconTagFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :icon_tag
    remove_column :categories, :featured_tagline
    remove_column :categories, :featured_image_url
  end
end
