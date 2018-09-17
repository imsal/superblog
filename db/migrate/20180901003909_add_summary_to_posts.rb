class AddSummaryToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :summary, :string
    remove_column :posts, :year
    remove_column :posts, :month
    remove_column :posts, :day
  end
end
