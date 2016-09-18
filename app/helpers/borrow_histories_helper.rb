module BorrowHistoriesHelper

  def get_return_status_label(status)
    RETURN_STATUS.each do |return_status|
      if return_status[:status] == status
        return return_status[:label]
      end
    end
  end
end
