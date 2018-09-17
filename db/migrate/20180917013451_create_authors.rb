class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :password_digest
      t.string :email
      t.text :bio

      t.timestamps
    end
  end
end
