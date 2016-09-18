class AmazonService

  def get_book_search_results(params)
    book_search_results = Array.new
    if params[:keyword].present?
      res = Amazon::Ecs.item_search(
          params[:keyword],
          search_index:  'Books',
          dataType: 'script',
          response_group: 'Medium',
          country:  'jp',
          power: "Not kindle"
        )
      res.items.each do |item|
        book_hash = Hash.new
        book_hash[:id] = AWSDATA
        book_hash[:search_from] = AWSDATA
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
    end
    book_search_results
  end
end
