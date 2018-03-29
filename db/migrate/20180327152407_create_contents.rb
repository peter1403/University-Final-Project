class CreateContents < ActiveRecord::Migration[5.1]
  def change
    create_table :contents do |t|
      t.string :name
      t.text :desc
      t.integer :rating, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :contents, [:user_id, :created_at]
  end
end
