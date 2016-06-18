
class User < ActiveRecord::Base
  belongs_to :job_type
  belongs_to :role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_paranoid

  scope :where_user_name, -> (user_name) { where("user_name like ?", "%" + user_name + "%") }
  scope :where_job_type, -> (job_type) { where("job_type = ?", job_type) }
  scope :where_belonging, -> (belonging) { where("belonging = ?", belonging) }
  scope :where_employee_number, -> (employee_number) { where("employee_number = ?", employee_number) }
  scope :get_by_employee_number, -> { where("employee_number is not NULL") }
  scope :get_user, -> { where("employee_number is NULL") }

  def self.get_all_users
    User.all
  end

  def self.get_users
    User.all.get_user
  end

  def self.get_by_search_params(params)
    users = User.where_user_name(params[:user_name]) if params[:user_name].present?
    users = users.where_job_type(params[:job_type]) if params[:job_type].present?
    users = users.where_belonging(params[:belonging]) if params[:belonging].present?
  end

  def self.get_employees
    User.get_by_employee_number
  end

  def self.get_employees_by_search_params(params)
    employees = User.where_user_name(params[:user_name]) if params[:user_name].present?
    employees = employees.where_job_type(params[:job_type]) if params[:job_type].present?
    employees = employees.where_belonging(params[:belonging]) if params[:belonging].present?
    employees = employees.where_employee_number(params[:employee_number]) if params[:employee_number].present?
    employees = employees.get_by_employee_number
  end


  def job_label
    job_types = JobType.all
    job_types.each do |job|
      return job.job_type_name if job.id == self.job_type
    end
  end

end
