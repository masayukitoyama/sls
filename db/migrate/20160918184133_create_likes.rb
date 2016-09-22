class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :book_id
      t.datetime :deleted_at
      t.timestamps null: false
    end
    add_index :likes, [:user_id, :book_id], unique: true
  end
end
