class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @recommend_books = Book.get_recommend_books
    @books = Book.all
    @book_menu = MENU_ACTIVE
  end

  def show
  end

  def search
    @book_search_menu = MENU_ACTIVE
    search_book_from_data()
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    def search_book_from_data
      @book_search_results = Array.new
      if params[:search_from] == EXISTDATA
        # DBから検索
        @book_search_results = Book.get_data_from_search_params(params)
      elsif params[:search_from] == AWSDATA
        # Amazonから検索
        amazon_service = AmazonService.new
        @book_search_results = amazon_service.get_book_search_results(params)
      end
    end

end
