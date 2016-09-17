class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :isbn
      t.datetime :deleted_at
      t.timestamps null: false
    end
  end
end
