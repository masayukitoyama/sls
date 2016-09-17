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
      # book_search_results = Hash.new
      # res.items.each do |item|
      #   book_search_results[:asin] = item.get('ASIN')
      #   book_search_results[:item_image] = item.get_hash('MediumImage')
      #   book_search_results[:title] =
      # end
    end
  end
end
