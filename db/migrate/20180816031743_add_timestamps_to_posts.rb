class AddTimestampsToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :year, :integer
    add_column :posts, :month, :integer
    add_column :posts, :day, :integer
  end
end
