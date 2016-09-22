class BorrowHistoriesController < ApplicationController

  def index
    @borrow_histories = BorrowHistory.get_all_order_limit_date_asc
    @borrow_history_menu = MENU_ACTIVE
  end

  def create
    @borrow_history = BorrowHistory.new(get_borrow_params)
    @borrow_history.user_id = current_user.id
    if @borrow_history.valid?
      @borrow_history.save
    end
    redirect_to borrow_histories_path
  end

  def show
    @book_history = BorrowHistory.find_by(id: params[:id])
    unless @book_history
      return render_404
    end
  end

  def ranking

  end

  private
    def get_borrow_params
      params.permit(:book_id, :return_day_type, :return_limit_date)
    end

end
