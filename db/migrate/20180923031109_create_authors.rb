class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :email_address
      t.text :bio
      t.string :password_digest
      t.string :authorization_token
      t.boolean :authorized

      t.timestamps
    end
  end
end
