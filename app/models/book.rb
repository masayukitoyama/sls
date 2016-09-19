class Book < ActiveRecord::Base

  acts_as_paranoid

  has_many :borrow_histories
  scope :where_id, -> (id) { where(id: id) }
  scope :where_asin, -> (asin) { where(asin: asin) }

  def self.get_recommend_books
    books = Book.all.uniq()
  end

  def self.get_data_from_search_params(params)
    key = params[:key]
    search_books = self.where("books.#{key} LIKE ?", "%" + params[:keyword] + "%").order(isbn_13: :asc)
  end

  def self.count_book_stock(book)
    stocks = self.where_asin(book.asin).count()
    stocks = stocks ? stocks : 0
  end

end
