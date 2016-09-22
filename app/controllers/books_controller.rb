class BooksController < ApplicationController

  def index
    @recommend_books = Book.get_recommend_books
    @books = Book.all.order(asin: :asc)
    @book_menu = MENU_ACTIVE
  end

  def show
    @book = Book.find_by(id: params[:id])
    unless @book
      return render_404
    end
    @total_stock = Book.count_book_stock(@book)
    @borrow_count = BorrowHistory.count_book_borrow(@book)
    @latest_book_history = BorrowHistory.get_latest_history_by_book_id(params[:id])
    @is_borrowing = is_borrowing?
  end

  def search
    @book_search_menu = MENU_ACTIVE
    @book_search_results = search_book_from_data()
    gon.user = current_user
  end

  def new
    unless viewable_book_new?(current_user)
      return render_404
    end
    @book = params[:book]
  end

  def create
    unless exectable_book_create?(current_user)
      return render_404
    end
    @book = Book.new(get_book_params)
    if @book.valid?
      @book.save
      redirect_to book_search_path
    else
      render :new
    end
  end

  def update
    unless exectable_book_update?(current_user)
      return render_404
    end
    @book = Book.find_by(id: params[:id])
  end

  private
    def get_book_params
      params.permit(:isbn_10, :isbn_13, :asin, :title, :author, :return_day_type, :image_url, :detail_page_url)
    end

    def search_book_from_data
      book_search_results = Array.new
      if params[:search_from] == EXISTDATA
        # DBから検索
        search_results = Book.get_data_from_search_params(params)
        book_search_results = BookService.set_book_search_results(search_results)
      elsif params[:search_from] == AWSDATA
        # Amazonから検索
        amazon_service = AmazonService.new
        book_search_results = amazon_service.get_book_search_results(params)
        book_search_results = Require.add_total_requires(book_search_results)
      end
      book_search_results
    end

    def is_borrowing?
      unless @latest_book_history
        return false
      end
      if @total_stock <= @borrow_count || @latest_book_history.return_status > 0
        return true
      end
      false
    end

end
