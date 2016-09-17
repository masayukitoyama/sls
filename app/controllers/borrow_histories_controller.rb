class BorrowHistoriesController < ApplicationController

  def index
    borrow_histories = BorrowHistory.all
    @borrow_history_menu = MENU_ACTIVE
  end
end
