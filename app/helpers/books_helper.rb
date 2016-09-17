module BooksHelper

  def get_book_columns
    BOOK_COLUMN.inject(Array.new) do |options, column|
      options << [column[:value], column[:key]]
    end
  end

end
