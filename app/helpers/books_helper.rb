module BooksHelper

  def get_book_columns
    BOOK_COLUMN.inject(Array.new) do |options, column|
      options << [column[:value], column[:key]]
    end
  end

  def return_day_label(return_day_type)
    RETURN_DAYS.each do |return_day|
      if return_day[:id] == return_day_type
        return return_day[:label]
      end
    end
  end
end
