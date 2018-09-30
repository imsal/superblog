class AddActivationToSubscriber < ActiveRecord::Migration[5.2]
  def change
    add_column :subscribers, :activation_digest, :string
    add_column :subscribers, :activated, :boolean, default: false
    add_column :subscribers, :activated_at, :datetime
  end
end
