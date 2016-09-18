class CreateRequires < ActiveRecord::Migration
  def change
    create_table :requires do |t|
      t.integer :user_id, null: false
      t.string  :asin, null: false
      t.integer :lowest_new_price
      t.integer :lowest_used_price
      t.datetime  :deleted_at
      t.timestamps null: false
    end
  end
end
