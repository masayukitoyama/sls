class RequiresController < ApplicationController

  def index
    requires = Require.all
    require_ranking = Require.get_requires_order_counts_desc(params)
    @book_requires = set_ranking(requires, require_ranking)
  end

  private
    def set_ranking(requires, require_ranking)
      book_requires = Array.new
      require_ranking.each do |ranking|
        requires.each do |book_require|
          if book_require.asin == ranking[0]
            book_require.require_count = ranking[1]
            book_requires << book_require
            break
          end
        end
      end
      book_requires
    end

    def iterate_require_ranking(book_require)

    end

end
