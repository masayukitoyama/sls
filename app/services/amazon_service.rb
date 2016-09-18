class AmazonService

  def get_book_search_results(params)
    if params[:keyword]
      res = Amazon::Ecs.item_search(
          params[:keyword],
          search_index:  'Books',
          dataType: 'script',
          response_group: 'Medium',
          country:  'jp',
          power: "Not kindle"
        )
      book_search_results = Array.new
      res.items.each do |item|
        book_hash = Hash.new
        book_hash[:search_from] = "amazon"
        book_hash[:asin] = item.get('ASIN')
        item_attributes = item.get_hash('ItemAttributes')
        book_hash[:isbn_10] = item_attributes["ISBN"]
        book_hash[:isbn_13] = item_attributes["EAN"]
        book_hash[:title] = item_attributes["Title"]
        book_hash[:author] = item_attributes["Author"]
        book_hash[:image_url] = item.get_hash("MediumImage")["URL"] if item.get_hash("MediumImage")
        book_hash[:detail_page_url] = item.get("DetailPageURL")
        book_search_results << book_hash
      end
      book_search_results
    end
  end
end
