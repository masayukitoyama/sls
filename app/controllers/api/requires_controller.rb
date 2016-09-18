class Api::RequiresController < ApiApplicationController

  def create
    @require = Require.new
    @require.user_id = params[:user_id]
    @require.asin = params[:asin]
    @require.title = params[:title]
    @require.author = params[:author]
    @require.image_url = params[:image_url]
    @require.detail_page_url = params[:detail_page_url]
    if @require.valid?
      @require.save!
      @total_requires = Require.get_count_by_asin(params[:asin])
    end
  end

end
