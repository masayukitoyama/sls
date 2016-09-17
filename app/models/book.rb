class Book < ActiveRecord::Base

  acts_as_paranoid

  scope :where_id, -> (id) { where(id: id) }
  scope :where_asin, -> (asin) { where(asin: asin) }

  def self.get_recommend_books
    recommend_book_ids = rand(3) + 1
    books = Book.all
    books.where_id(recommend_book_ids)
  end

  def self.get_data_from_search_params(params)
    key = params[:key]
    self.where(key.to_sym => params[:keyword])
  end

end
