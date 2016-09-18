class BorrowHistory < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  scope :join_book, -> { joins(:book) }
  scope :where_book_asin, -> (asin) { where('books.asin = ?', asin) }
  scope :where_borrowing, -> { where(return_status: [RETURN_STATUS[1][:status], RETURN_STATUS[2][:status]]) }

  def self.get_all_order_limit_date_asc
    self.all.order(return_limit_date: :asc)
  end

  def self.count_book_borrow(book)
    borrow_count = self.join_book.where_book_asin(book.asin).where_borrowing.count
    borrow_count = borrow_count ? borrow_count : 0
  end
end
