class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :isbn_10
      t.string :isbn_13
      t.string :asin
      t.string :title
      t.string :author
      t.text   :image_url
      t.date   :default_limit_date
      t.datetime :deleted_at
      t.timestamps null: false
    end
  end
end
