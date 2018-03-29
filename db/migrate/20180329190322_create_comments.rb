class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :content_text
      t.references :user, foreign_key: true
      t.references :content, foreign_key: true

      t.timestamps
    end
    add_index :comments, [:content_id, :created_at]
  end
end
