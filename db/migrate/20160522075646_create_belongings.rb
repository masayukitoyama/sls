class CreateBelongings < ActiveRecord::Migration
  def change
    create_table :belongings do |t|
      t.string :belonging_name, null: false
      t.datetime :deleted_at
      t.timestamps null: false
    end
  end
end
