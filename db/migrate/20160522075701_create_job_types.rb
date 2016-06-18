class CreateJobTypes < ActiveRecord::Migration
  def change
    create_table :job_types do |t|
      t.string  :job_type_name, null: false
      t.datetime :deleted_at
      t.timestamps null: false
    end
  end
end
