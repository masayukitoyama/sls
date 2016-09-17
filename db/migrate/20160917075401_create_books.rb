class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :isbn
      t.text   :image_url
      t.datetime :deleted_at
      t.timestamps null: false
    end
  end
end
