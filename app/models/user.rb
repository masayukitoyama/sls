
class User < ActiveRecord::Base

  belongs_to :role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_paranoid

  scope :where_user_name, -> (user_name) { where("user_name like ?", "%" + user_name + "%") }
  scope :where_job_type, -> (job_type) { where("job_type = ?", job_type) }
  scope :where_belonging, -> (belonging) { where("belonging_id = ?", belonging) }

  def self.get_all_users
    User.all
  end

  def self.get_by_search_params(params)
    users = self.where_user_name(params[:user_name]) if params[:user_name].present?
    users = self.where_job_type(params[:job_type]) if params[:job_type].present?
    users = self.where_belonging(params[:belonging]) if params[:belonging].present?
  end
end
