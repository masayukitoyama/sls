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
      item_hash = Hash.new
      binding.pry
      res.items.each do |item|
        item_hash[:asin] = item.get('ASIN')
        item_hash[:item_image] = item.get_hash('MediumImage')
        item_attributes = item.get_hash('ItemAttributes')
        item_hash[:isbn_10] = item_attributes["ISBN"]
        item_hash[:isbn_13] = item_attributes["EAN"]
        item_hash[:title] = item_attributes["Title"]
        item_hash[:author] = item_attributes["Author"]
        item_hash[:image_url] = item.get_hash("MediumImage")["URL"]
        book_search_results << item_hash
      end
      book_search_results
    end
  end
end
