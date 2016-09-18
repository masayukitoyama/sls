class BorrowHistory < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  scope :join_book, -> { joins(:book) }
  scope :join_user, -> { joins(:user) }
  scope :where_book_asin, -> (asin) { where('books.asin = ?', asin) }
  scope :where_borrowing, -> { where(return_status: [RETURN_STATUS[1][:status], RETURN_STATUS[2][:status]]) }
  scope :where_book_id, -> (book_id) { where(book_id: book_id) }
  scope :where_user_id, -> (user_id) { where(user_id: user_id) }

  def self.get_all_order_limit_date_asc
    self.all.order(return_limit_date: :asc)
  end

  def self.count_book_borrow(book)
    borrow_count = self.join_book.where_book_asin(book.asin).where_borrowing.count
    borrow_count = borrow_count ? borrow_count : 0
  end

  def self.get_latest_history_by_book_id(book_id)
    self.join_book.where_book_id(book_id).order(updated_at: :desc).first()
  end

  def self.get_latest_history_by_user_id(user_id)
    self.join_user.where_user_id(user_id).order(updated_at: :desc).first()
  end
end
