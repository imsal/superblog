class AddActivationDateToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :activation_date, :datetime, default: nil
    add_column :posts, :active, :boolean, default: false
    remove_column :posts, :status
  end
end
