class CreateBatchStatuses < ActiveRecord::Migration
  def change
    create_table :batch_statuses do |t|
      t.integer :batch_type, null: false
      t.integer :is_running, null: false
      t.datetime :last_started_at
      t.datetime :last_ended_at
      t.timestamps null: false
    end
  end
end
