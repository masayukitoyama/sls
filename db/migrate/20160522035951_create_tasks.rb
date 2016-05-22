class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :task_category_id, null: false
      t.string  :task_title, null: false
      t.text    :task_content, null: false
      t.text    :task_example
      t.datetime :deleted_at
      t.timestamps null: false
    end
  end
end
