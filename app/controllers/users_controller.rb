class UsersController < ApplicationController

  def index
    @users = User.get_users
    @user_menu = MENU_ACTIVE
  end

  def search
    @users = get_by_search_params(params)
    @user_menu = MENU_ACTIVE
    render :index
  end

  private
    def get_by_search_params(params)
      return User.get_by_search_params(params)
    end
end
