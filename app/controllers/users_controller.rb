class UsersController < ApplicationController
  protect_from_forgery :expect => [:search]

  def index
    @users = User.get_all_users
    @user_menu = MENU_ACTIVE
  end

  def search
    @users = get_by_search_params(params)
    render :index
  end

  private
    def get_by_search_params(params)
      return User.get_by_search_params(params)
    end
end
