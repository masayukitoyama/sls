class BorrowHistoriesController < ApplicationController

  def index
    @borrow_histories = BorrowHistory.get_all_order_limit_date_asc
    @borrow_history_menu = MENU_ACTIVE
  end

  def create
    @borrow_history = BorrowHistory.new
    @borrow_history.user_id = current_user.id
    @borrow_history.book_id = params[:book_id]
    @borrow_history.return_limit_date = params[:return_limit_date]
    if @borrow_history.valid?
      @borrow_history.save
    end
    redirect_to borrow_histories_path
  end

  def ranking
    
  end

  private
    def get_borrow_params
      params.permit(:book_id, :return_day_type)
    end

end
