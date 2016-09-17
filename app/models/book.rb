class Book < ActiveRecord::Base

  acts_as_paranoid

  scope :where_id, -> (id) { where(id: id) }
  def self.get_recommend_books
    recommend_book_ids = rand(10) + 1
    books = Book.all
    books.where_id(recommend_book_ids)
  end
end
