class Book < ActiveRecord::Base

  acts_as_paranoid

  scope :where_id, -> (id) { where(id: id) }
  scope :where_asin, -> (asin) { where(asin: asin) }

  def self.get_recommend_books
    books = Book.all
  end

  def self.get_data_from_search_params(params)
    key = params[:key]
    search_books = self.where("books.#{key} LIKE ?", "%" + params[:keyword] + "%")
  end

end
