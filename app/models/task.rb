class Task < ActiveRecord::Base
  belongs_to :task_category

  acts_as_paranoid

end
