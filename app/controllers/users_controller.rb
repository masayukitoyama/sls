class UsersController < ApplicationController
  protect_from_forgery :expect => [:search]

  def index
    @users = User.get_all_users
    @user_menu = MENU_ACTIVE
  end

  def search
    @users = get_user_params(params)
    render :index
  end

  private
    def get_user_params(params)
      
    end
end
