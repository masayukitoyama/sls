class TaskCategory < ActiveRecord::Base
  has_many :tasks

  acts_as_paranoid

end
