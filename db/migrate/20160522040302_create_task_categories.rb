class CreateTaskCategories < ActiveRecord::Migration
  def change
    create_table :task_categories do |t|
      t.string   :task_category_title
      t.datetime :deleted_at
      t.timestamps null: false
    end
  end
end
