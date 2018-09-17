class UpdatePostAttributes < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :status, :integer
    remove_column :posts, :subtitle
  end
end
