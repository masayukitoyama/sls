class Api::LikesController < ApiApplicationController

  def create
    @like = Like.new
    @like.user_id = params[:user_id]
    @like.book_id = params[:book_id]
    if @like.valid?
      @like.save!
      @total_likes = Like.get_count_by_book_id(params[:book_id])
    end
  end

end
