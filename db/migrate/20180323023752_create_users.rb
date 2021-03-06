class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :remember_digest
      t.text :description, default: "No description"
      t.boolean :admin, default: false
      t.timestamps
    end
  end
end
