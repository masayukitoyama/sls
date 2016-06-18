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
  scope :get_with_employee_number, -> { where("employee_number is not NULL") }
  scope :get_without_employee_number, -> { where("employee_number is NULL") }

  enum role_id: {
    admin: 1,
    leader: 2,
    view: 3,
    normal: 4
  }

  def job_label
    job_types = JobType.all
    job_types.each do |job|
      return job.job_type_name if job.id == self.job_type
    end
  end

  def role_label
    roles = Role.all
    roles.each do |role|
      return role.role_name if role.id == self.role_id
    end
  end

  def belonging_label
    belongings = Role.all
    belongings.each do |belonging|
      return belonging.belonging_name if belonging.id == self.belonging_id
    end
  end

  def self.get_users_by_search_params(params)
    users = User.get_without_employee_number
    users = users.where_user_name(params[:user_name]) if params[:user_name].present?
    users = users.where_job_type(params[:job_type]) if params[:job_type].present?
    users = users.where_belonging(params[:belonging]) if params[:belonging].present?
    return users
  end

  def self.get_employees_by_search_params(params)
    employees = User.get_with_employee_number
    employees = employees.where_user_name(params[:user_name]) if params[:user_name].present?
    employees = employees.where_job_type(params[:job_type]) if params[:job_type].present?
    employees = employees.where_belonging(params[:belonging]) if params[:belonging].present?
    employees = employees.where_employee_number(params[:employee_number]) if params[:employee_number].present?
    return employees
  end



end
