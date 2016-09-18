class CreateBorrowHistories < ActiveRecord::Migration
  def change
    create_table :borrow_histories do |t|
      t.integer :user_id
      t.integer :book_id
      t.date    :return_limit_date
      t.integer :return_status, default: 1
      t.timestamps null: false
    end
  end
end
