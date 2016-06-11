class Task < ActiveRecord::Base
  belongs_to :task_category

  acts_as_paranoid

  def self.get_all_tasks
    Task.all
  end

end
