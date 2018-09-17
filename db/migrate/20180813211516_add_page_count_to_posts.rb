class AddPageCountToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :page_count, :bigint, default: 0
  end
end
