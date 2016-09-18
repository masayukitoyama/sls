class BooksController < ApplicationController
  before_action :set_book, only: [:edit, :update, :destroy]

  def index
    @recommend_books = Book.get_recommend_books
    @books = Book.all
    @book_menu = MENU_ACTIVE
  end

  def show
    @book = Book.find_by(id: params[:id])
  end

  def search
    @book_search_menu = MENU_ACTIVE
    search_book_from_data()
  end

  def new
    @book = params[:book]
  end

  def create
    @book = Book.new(get_book_params)
    if @book.valid?
      @book.save
      redirect_to books_path
    end
  end

  private
    def get_book_params
      params.permit(:isbn_10, :isbn_13, :asin, :title, :author, :return_day_type, :image_url, :detail_page_url)
    end

    def search_book_from_data
      @book_search_results = Array.new
      if params[:search_from] == EXISTDATA
        # DBから検索
        search_results = Book.get_data_from_search_params(params)
        @book_search_results = BookService.set_book_search_results(search_results)
      elsif params[:search_from] == AWSDATA
        # Amazonから検索
        amazon_service = AmazonService.new
        @book_search_results = amazon_service.get_book_search_results(params)
      end
    end

end
