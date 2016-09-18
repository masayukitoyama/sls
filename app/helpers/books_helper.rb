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

  def return_status_label(status)
    if status > 0
      return "貸出中"
    else
      return "貸出可能"
    end
  end

  def enable_borrow?(book_hash)
    unless book_hash[:latest_book_history]
      return true
    end
    if book_hash[:total_stock] <= book_hash[:borrow_count] || book_hash[:latest_book_history].return_status > 0
      return true
    end
    false
  end
end
