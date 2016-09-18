class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_paranoid

  scope :where_user_name, -> (user_name) { where("user_name like ?", "%" + user_name + "%") }
  scope :where_email, -> (email) { where("email like ?", "%" + email + "%") }


  enum authority_type: {
    admin: 0,
    view: 1,
    normal: 2
  }

  def self.get_users_by_search_params(params)
    users = User.all
    users = self.where_user_name(params[:user_name]) if params[:user_name].present?
    users = self.where_email(params[:email]) if params[:email].present?
    return users
  end

  def update_user_info(params)
    update(
      user_name: params[:user_name],
      email: params[:email]
      )
  end

  def create_user(params)
    self.user_name = params[:user_name]
    self.email = params[:email]
    self.password = params[:password]
    self.authority_type = params[:authority_type].to_i
    if self.valid?
      self.save
    end
  end
end
