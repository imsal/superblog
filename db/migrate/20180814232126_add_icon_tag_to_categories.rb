class AddIconTagToCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :icon_tag, :text
  end
end
