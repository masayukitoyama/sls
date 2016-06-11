class UsersController < ApplicationController

  def index
    @users = User.get_all_users
    @user_menu = MENU_ACTIVE
  end
end
