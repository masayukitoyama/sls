class CreateRequires < ActiveRecord::Migration
  def change
    create_table :requires do |t|
      t.integer :user_id, null: false
      t.string  :asin, null: false
      t.string  :title
      t.string  :author
      t.integer :lowest_new_price
      t.integer :lowest_used_price
      t.text :image_url
      t.text :detail_page_url
      t.datetime  :deleted_at
      t.timestamps null: false
    end
    add_index :requires, [:user_id, :asin], unique: true
  end
end
