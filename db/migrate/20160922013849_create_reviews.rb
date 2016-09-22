class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :book_id
      t.string  :asin
      t.integer :star
      t.text :comment
      t.datetime :deleted_at
      t.timestamps null: false
    end
  end
end
