class Api::UsersController < ApiApplicationController

  def create
    binding.pry
    @user = User.new(get_user_params)
    if @user.valid?
      @user.save
    end
  end

  def update
    @user = User.find_by_user_id_with_deleted(params[:id])
    if executable_action?(@user)
      @user.update_user_info(get_user_params.tap{ |u| u[:role_type] = u[:role_type].to_i })
    end
  end

  def init_password
    @user = User.find_by_user_id_with_deleted(params[:id])
    if executable_action?(@user)
      @user.init_password(@user.email)
      if current_user.id == @user.id
        redirect_to destroy_user_session_path
      end
    end
  end

  private
    def get_user_params
      params.permit(:user_name, :email, :password)
    end

end
