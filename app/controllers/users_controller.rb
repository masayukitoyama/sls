class UsersController < ApplicationController

  def index
    @users = get_by_search_params(params)
    gon.users = @users
    @user_menu = MENU_ACTIVE
  end


  private
    def get_by_search_params(params)
      return User.get_users_by_search_params(params)
    end

end
