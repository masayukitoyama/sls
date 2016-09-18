class BookService

  def self.set_book_search_results(search_books)
    book_search_results = Array.new
    search_books.each do |search_book|
      book_hash = Hash.new
      book_hash[:id] = search_book.id
      book_hash[:search_from] = EXISTDATA
      book_hash[:asin] = search_book.asin
      book_hash[:isbn_10] = search_book.isbn_10
      book_hash[:isbn_13] = search_book.isbn_13
      book_hash[:title] = search_book.title
      book_hash[:author] = search_book.author
      book_hash[:image_url] = search_book.image_url
      book_hash[:detail_page_url] = search_book.detail_page_url
      book_hash[:return_day_type] = search_book.return_day_type
      book_search_results << book_hash
    end
    book_search_results
  end

end
