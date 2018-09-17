class AddSubtitleTextToCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :featured_tagline, :text
    add_column :categories, :featured_image_url, :string
  end
end
