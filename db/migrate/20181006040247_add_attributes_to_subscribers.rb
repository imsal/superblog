class AddAttributesToSubscribers < ActiveRecord::Migration[5.2]
  def change
    add_column :subscribers, :unsubscribed, :boolean, default: false
    add_column :subscribers, :unsubscribe_digest, :string
    add_column :subscribers, :unsubscribed_at, :datetime, default: nil
  end
end
