class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_paranoid

  scope :where_user_name, -> (user_name) { where("user_name like ?", "%" + user_name + "%") }

  def self.get_users_by_search_params(params)
    users = self.where_user_name(params[:user_name]) if params[:user_name].present?
    return users
  end

  def update_user_info(params)
    update(
      user_name: params[:user_name],
      email: params[:email]
      )
  end



end
