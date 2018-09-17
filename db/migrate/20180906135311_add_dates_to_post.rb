class AddDatesToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :year, :string
    add_column :posts, :day, :string
    add_column :posts, :month, :string
  end
end
